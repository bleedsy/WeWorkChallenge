//
//  EditIssueVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class EditIssueVC: RootVC {
    
    @IBOutlet weak var IBtitle : UITextField!
    @IBOutlet weak var IBbody : UITextView!
    @IBOutlet weak var IBissueStatus : UIButton!
    
    var welRepo : RepoObject!
    var welIssue : IssueObject!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Setup UI
    
    func setUpUI() {
        IBtitle.text = welIssue.welTitle
        IBbody.text = welIssue.welBody
        
        IBbody.layer.borderColor = UIColor.lightGray.cgColor
        IBbody.layer.borderWidth = 2
        IBbody.layer.masksToBounds = true
        IBbody.layer.cornerRadius = 5
    }
    
    //MARK: Actions
    
    @IBAction func status(sender: UIButton) {
        
    }
    
    @IBAction func save(sender: UIButton) {
        let title = IBtitle.text
        let body = IBbody.text
        let number = String(format: "%i", welIssue.welNumber ?? 0)
        APIManagerImplement.patchUpdateIssue(repoName: welRepo.welName!, number: number, title: title!, body: body, state: welIssue.welState) { (result, error) in
            if error == nil {
                
            } else {
                self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
            }
        }
    }
}
