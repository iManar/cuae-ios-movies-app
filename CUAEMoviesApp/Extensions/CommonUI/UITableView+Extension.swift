//
//  UITableView+Extension.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/21/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//


import UIKit

public extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        
        let identifier = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(_ cellClass: AnyClass) {
        
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        register(nib, forCellReuseIdentifier: identifier)
    }
}

