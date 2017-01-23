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
            if let user = result as? NSDictionary {
                UserInfo.currentUser.setUserInfo(user)
            }
            completion(nil, error)
        }
    }
    
    class func getRepos(completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let fullEndpoint = Constants.API.URL + GETrepos
        APIManager.makeGetRequest(fullEndpoint, params: nil) { (result, error) in
            var userRepos = Array<RepoObject>()
            if let repos = result as? NSArray {
                for repoDic in repos {
                    let repo = RepoObject(result: repoDic as! NSDictionary)
                    userRepos.append(repo)
                }
            }
            completion(userRepos, error)
        }
    
    }
    
}
