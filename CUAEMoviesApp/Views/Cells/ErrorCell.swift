//
//  VFTopUpRecordErrorCell.swift
//  MyVodafone
//
//  Created by Manar Magdy on 7/15/18.
//  Copyright © 2017 Manar Magdy. All rights reserved.
//

import UIKit

class ErrorCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet private weak var errorDescription: UILabel!

  
    
    func setupWithMsg(_ text: String) {
        errorDescription.text = text
    }
}
