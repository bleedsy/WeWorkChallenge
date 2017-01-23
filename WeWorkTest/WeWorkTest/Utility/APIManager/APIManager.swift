//
//  APIManager.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    
    class func makeGetRequest(_ endPoint: URLConvertible, params: NSDictionary?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let credentialData = "\(Constants.userInfo.username):\(Constants.userInfo.password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(endPoint,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                completion(response.result.value, response.result.error)
        }
    }
    
    class func makePatchRequest(_ endPoint: URLConvertible, params: Parameters?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let credentialData = "\(Constants.userInfo.username):\(Constants.userInfo.password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        Alamofire.request(endPoint,
                          method: .patch,
                          parameters: params,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                completion(response.result.value, response.result.error)
        }
    }
    
    class func makePostRequest(_ endPoint: URLConvertible, params: Parameters?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let credentialData = "\(Constants.userInfo.username):\(Constants.userInfo.password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)", "Content-Type" : "application/json"]
        
        Alamofire.request(endPoint,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                completion(response.result.value, response.result.error)
        }
    }
}
