//
//  UserInfo.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class UserInfo: NSObject {
    
    static let currentUser = UserInfo()
    
    var welName : String?
    var welBio : String?
    var welLogin : String?
    var welAvatarURL : String?
    var welFollowing : Int?
    var welFollowers : Int?
    
    fileprivate override init() {
        super.init()
    }
    
    // Setup UserInfo
    func setUserInfo(_ result: NSDictionary) {
        if let name = result["name"] as? String {
            welName = name
        }
        
        if let bio = result["bio"] as? String {
            welBio = bio
        }
        
        if let login = result["login"] as? String {
            welLogin = login
        }
        
        if let avatar = result["avatar_url"] as? String {
            welAvatarURL = avatar
        }
        
        if let following = result["following"] as? Int {
            welFollowing = following
        }
        
        if let followers = result["followers"] as? Int {
            welFollowers = followers
        }
    }

}
