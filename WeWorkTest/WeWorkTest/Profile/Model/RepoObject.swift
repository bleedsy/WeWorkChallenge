//
//  RepoObject.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class RepoObject: NSObject {
    
    var welName : String?
    var welDescription : String?
    var welLanguage : String?
    var welOpenIssues : Int = 0
    
    init(result: NSDictionary) {
        if let name = result["name"] as? String {
            welName = name
        }
        
        if let desc = result["description"] as? String {
            welDescription = desc
        }
        
        if let language = result["language"] as? String {
            welLanguage = language
        }
        
        if let openIssues = result["open_issues"] as? Int {
            welOpenIssues = openIssues
        }
    }
}
