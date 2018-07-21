//
//  String+Extension.swift
//  CUAEMoviesApp
//
//  Created by tr on 7/21/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation


extension String {
    
    func formate() -> String {
        guard self.count > 0 else { return "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = MoviesListConstants.defaultDateFormat
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = MoviesListConstants.targetDateFormat
        return  dateFormatter.string(from: date)
    }
}

