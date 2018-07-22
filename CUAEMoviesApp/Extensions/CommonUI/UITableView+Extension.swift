//
//  UITableView+Extension.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/15/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//


import UIKit

public extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    func registerCellNib(_ cellClass: AnyClass) {
        let nib = UINib(nibName: String(describing: cellClass), bundle: nil)
        register(nib, forCellReuseIdentifier: String(describing: cellClass))
    }
}

