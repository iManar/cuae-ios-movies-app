//
//  EasyCashing.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/22/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import Foundation


public protocol EasyCashing {
    func cache(object: Any, forKey key: String)
    func load(objectForKey key: String) -> Any?
}

class EasyCashingImplementation: EasyCashing {
    
    private func fullPersistencePath(file: String) -> URL {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let pathString = documentsPath.appendingPathComponent(file)
        return URL(fileURLWithPath: pathString)
    }
    
    func cache(object: Any, forKey key: String) {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: object)
        let url = fullPersistencePath(file: key)
        do {
            try archivedData.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func load(objectForKey key: String) -> Any? {
        let url = fullPersistencePath(file: key)
        do {
            let data = try Data(contentsOf: url)
            return NSKeyedUnarchiver.unarchiveObject(with: data)
        } catch {
            print(error)
        }
        return nil
    }
}
