//
//  IssueObject.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class IssueObject: NSObject {

    var welID : Int?
    var welTitle : String?
    var welBody : String?
    var welState : String?
    var welNumber : Int?
    
    init(result: NSDictionary) {
        if let id = result["id"] as? Int {
            welID = id
        }
        
        if let title = result["title"] as? String {
            welTitle = title
        }
        
        if let body = result["body"] as? String {
            welBody = body
        }
        
        if let state = result["state"] as? String {
            welState = state
        }
        
        if let number = result["number"] as? Int {
            welNumber = number
        }
    }
}
