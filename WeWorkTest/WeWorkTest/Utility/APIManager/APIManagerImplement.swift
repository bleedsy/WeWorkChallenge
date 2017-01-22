//
//  APIManagerImplement.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class APIManagerImplement: NSObject {
    
    static let GETuserInfo = "/user"
    static let GETrepos = "/user/repos"

    class func getUserInfo(completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let fullEndpoint = Constants.API.URL + GETuserInfo
        APIManager.makeGetRequest(fullEndpoint, params: nil) { (result, error) in
            if error == nil {
                
            } else {
                
            }
        }
    }
    
}
