//
//  UIViewController+Extension.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/14/18.
//  Copyright © 2018 tr. All rights reserved.
//

import UIKit


extension UIViewController {
    
    class var viewControllerIdentifier : String {
        return "\(self)"
    }
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}


enum AppStoryboard : String {
    
    case Main
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let viewControllerIdentifier = (viewControllerClass as UIViewController.Type).viewControllerIdentifier
        guard let scene = instance.instantiateViewController(withIdentifier: viewControllerIdentifier) as? T else {
            fatalError("ViewController with identifier \(viewControllerIdentifier), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
