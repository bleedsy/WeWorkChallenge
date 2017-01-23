//
//  CreateIssueVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class CreateIssueVC: EditIssueVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setUpUI() {
        navigationController?.isNavigationBarHidden = false
        IBbody.layer.borderColor = UIColor.lightGray.cgColor
        IBbody.layer.borderWidth = 2
        IBbody.layer.masksToBounds = true
        IBbody.layer.cornerRadius = 5
    }
    
    //MARK: Actions
    
    @IBAction override func save(sender: UIButton) {
        let title = IBtitle.text
        let body = IBbody.text
        showLoadingView()
        APIManagerImplement.createIssue(repoName: welRepo.welName!, title: title, body: body) { (result, error) in
            self.hideLoadingView()
            if error == nil {
                _ = self.navigationController?.popViewController(animated: true)
            } else {
                self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
            }
        }
    }
}
