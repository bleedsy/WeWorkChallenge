//
//  RepoCell.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class RepoCell: UICollectionViewCell {
    
    @IBOutlet weak var IBname : UILabel!
    @IBOutlet weak var IBdesc : UILabel!
    @IBOutlet weak var IBissues : CustomLabel!
    @IBOutlet weak var IBlanguage : UILabel!
    
    var name: String? {
        didSet {
            IBname.text = name
        }
    }
    
    var desc: String? {
        didSet {
            IBdesc.text = desc
        }
    }
    
    var issues: Int? {
        didSet {
            IBissues.text = String(format: "%i", issues ?? 0)
        }
    }
    
    var language: String? {
        didSet {
            IBlanguage.text = language
        }
    }
    
    override func awakeFromNib() {
        IBissues.setCircular()
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
        layer.masksToBounds = true
        layer.cornerRadius = 5
    }
    
    
    func setUpCell(repo: RepoObject) {
        name = repo.welName
        desc = repo.welDescription
        issues = repo.welOpenIssues
        language = repo.welLanguage
    }
    
}
