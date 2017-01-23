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
    static let GETissues = "/repos/%@/%@/issues?state=all"
    static let PATCHissue = "/repos/%@/%@/issues/%@"

    //MARK: Login
    class func getUserInfo(completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let fullEndpoint = Constants.API.URL + GETuserInfo
        APIManager.makeGetRequest(fullEndpoint, params: nil) { (result, error) in
            if let user = result as? NSDictionary {
                UserInfo.currentUser.setUserInfo(user)
            }
            completion(nil, error)
        }
    }
    
    //MARK: Profile
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
    
    //MARK: Issues
    class func getRepoIssues(repoName: String, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let fullEndpoint = Constants.API.URL + String(format: GETissues, UserInfo.currentUser.welLogin!, repoName)
        APIManager.makeGetRequest(fullEndpoint, params: nil) { (result, error) in
            var repoIssues = Array<IssueObject>()
            if let issues = result as? NSArray {
                for issueDic in issues {
                    let issue = IssueObject(result: issueDic as! NSDictionary)
                    repoIssues.append(issue)
                }
            }
            completion(repoIssues, error)
        }
    }
    
    class func patchUpdateIssue(repoName: String, number: String, title: String, body: String?, state: String?, completion: @escaping (_ result: Any?, _ error: Error?) -> Void) {
        let fullEndpoint = Constants.API.URL + String(format: PATCHissue, UserInfo.currentUser.welLogin!, repoName, number)
        let params = ["title" : title, "body" : body ?? "", "state" : state]
        APIManager.makePatchRequest(fullEndpoint, params: params as NSDictionary?) { (result, error) in
            if let issue = result as? NSDictionary {
                print(issue)
            }
        }
    }
}
