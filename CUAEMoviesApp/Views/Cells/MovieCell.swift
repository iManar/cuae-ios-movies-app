//
//  MovieCell.swift
//  CareemMovie
//
//  Created by Tran Hoang Canh on 7/3/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit

final class MovieCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var overViewTextView: UITextView!
    @IBOutlet private weak var containMovieView: UIView!
    
    
    func setupWithModel(_ model: Movie) {
        
        movieNameLabel.text = model.title
        releaseDateLabel.text = model.releaseDate?.formate()
        overViewTextView.text = (model.overview?.count ?? 0) > 0 ? model.overview : "No description available"
        
        // Incase all image of movie is null
        let imagePath = model.posterPath ?? model.backdropPath
//        if let imagePath = imagePath {
//            let imageFullURL = Helper.getFullImageURL(imagePath: imagePath, type: .w185)
//            if let url = URL(string: imageFullURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
//                posterImageView.kf.setImage(with: url,
//                                            placeholder: UIImage(named: "movie_placeholder"),
//                                            options: [.transition(ImageTransition.fade(0.2))])
//            }
//        }
    }
    
}

