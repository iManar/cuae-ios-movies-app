//
//  VFTopUpRecordErrorCell.swift
//  MyVodafone
//
//  Created by Ahmed Askar on 12/17/17.
//  Copyright © 2017 TSSE. All rights reserved.
//

import UIKit

class ErrorCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet private weak var errorDescription: UILabel!

  
    
    func setupWithMsg(_ text: String) {
        errorDescription.text = text
    }
}
