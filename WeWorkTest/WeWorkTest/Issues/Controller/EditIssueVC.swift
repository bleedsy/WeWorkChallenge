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
        navigationController?.isNavigationBarHidden = false
        IBtitle.text = welIssue.welTitle
        IBbody.text = welIssue.welBody
        
        IBbody.layer.borderColor = UIColor.lightGray.cgColor
        IBbody.layer.borderWidth = 2
        IBbody.layer.masksToBounds = true
        IBbody.layer.cornerRadius = 5
        
        if welIssue.welState?.lowercased() == "closed" {
            IBissueStatus.setTitle("Open Issue", for: .normal)
        } else {
            IBissueStatus.setTitle("Close Issue", for: .normal)
        }
        
    }
    
    //MARK: API Call
    func updateIssue(title: String?, body: String?, state: String?) {
        let number = String(format: "%i", welIssue.welNumber ?? 0)
        showLoadingView()
        APIManagerImplement.patchUpdateIssue(repoName: welRepo.welName!, number: number, title: title, body: body, state: state) { (result, error) in
            self.hideLoadingView()
            if error == nil {
                _ = self.navigationController?.popViewController(animated: true)
            } else {
                self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
            }
        }
    }
    //MARK: Actions
    
    @IBAction func status(sender: UIButton) {
        if welIssue.welState == "open" {
            updateIssue(title: nil, body: nil, state: "closed")
        } else {
            updateIssue(title: nil, body: nil, state: "open")
        }
    }
    
    @IBAction func save(sender: UIButton) {
        let title = IBtitle.text
        let body = IBbody.text
        updateIssue(title: title, body: body, state: nil)
    }
}
