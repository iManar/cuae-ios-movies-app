//
//  Generic.swift
//  CUAEMoviesApp
//
//  Created by tr on 7/15/18.
//  Copyright © 2018 tr. All rights reserved.
//

import Foundation


/**
 *  TableShowMode enum for specifing the current status for the table content
 */
@objc public enum TableShowMode {
    case normal
    case error
    case loading
}


func genericError() -> NSError {
    
    return NSError(domain: "somedomain", code: 123, userInfo: [NSLocalizedDescriptionKey : "Something went wrong, Please try again later!"])
    
}
