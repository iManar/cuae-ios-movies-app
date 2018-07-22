//
//  MovieCell.swift
//  CareemMovie
//
//  Created by Manar Magdy on 7/3/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit
import SDWebImage

final class MovieCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var overViewTextView: UITextView!
    @IBOutlet private weak var containMovieView: UIView!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var movieNameLabel: UILabel!
    
    
    func setupWithModel(_ model: Movie) {
        
        movieNameLabel.text = model.title
        releaseDateLabel.text = model.releaseDate?.formate()
        overViewTextView.text = (model.overview?.count ?? 0) > 0 ? model.overview : "No description available"
        
        if let imagePath = model.posterPath ?? model.backdropPath {
            
            let path: MoviesDBUrls.Path = .image(size: .w185, imagePath: imagePath)
            let imageFullURL = path.absolutePath
            if URL(string: imageFullURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) != nil {
                posterImageView.sd_setImage(with: URL(string: imageFullURL), placeholderImage: #imageLiteral(resourceName: "defaultImage"))
            }
        }
    }
    
}

