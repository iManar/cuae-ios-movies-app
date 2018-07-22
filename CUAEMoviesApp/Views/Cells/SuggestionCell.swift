//
//  SuggestionCell.swift
//  CareemMovie
//
//  Created by Manar Magdy on 7/22/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

final class SuggestionCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var suggestionNameLabel: UILabel!

    func setupCellWithSuggestion(name: String, numOfResults: Int) {
        suggestionNameLabel.text = name
    }
    
}
