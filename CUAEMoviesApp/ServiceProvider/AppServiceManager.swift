//
//  AppServiceManager.swift
//  CUAEMoviesApp
//
//  Created by tr on 7/14/18.
//  Copyright © 2018 tr. All rights reserved.
//

import SVProgressHUD
import Alamofire

class AppServiceManager {
    
    class func doRequest(path: MoviesDBUrls.Path,
                         method: HTTPMethod,
                         params: [String: Any]? = nil,
                         success: @escaping (_ result: Any) -> Void,
                         failure: @escaping (_ err: Error) -> Void) {
        
        DispatchQueue.main.async(execute: {
            SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
            SVProgressHUD.show()
        })
        
        let urlString = "\(urlEnvironment.getBaseUrl())\(path.absolutePath)"
        let pathUrl = URL(string: urlString)!
        debugPrint("Get Request URL: \(pathUrl)")
        
        Alamofire.request(pathUrl,
                          method: method,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: nil).responseJSON { (response: DataResponse<Any>) in
                            
                            DispatchQueue.main.async(execute: {
                                SVProgressHUD.dismiss()
                            })
                            
                            switch response.result {
                            case .success(let value):
                                success(value)
                            case .failure(let error):
                                debugPrint(error)
                                failure(error)
                            }
        }
    }
    
    
    
    
    class var urlEnvironment: MoviesDBUrls.UrlEnvironment {
        return .baseUrl
    }
}





