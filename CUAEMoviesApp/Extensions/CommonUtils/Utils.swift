//
//  Generic.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/15/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import Foundation


/**
 *  TableShowMode enum for specifing the current status for the table content
 */
public enum TableShowMode {
    case normal
    case error(msg: String)
    case loading
}

var genericError: NSError {
    return NSError(domain: "somedomain", code: 123, userInfo: [NSLocalizedDescriptionKey : "Something went wrong, Please try again later!"])
}

