//
//  ProfileVC+PopUpView.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/26/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

extension ProfileVC {

    func showIssues(repo: RepoObject) {
        let dimView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        dimView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.50)
        view.addSubview(dimView)
        
        let issuesController = getVCFromStoryboard("Main", viewController: "IssuesVC") as! IssuesVC
        issuesController.welRepo = repo
        issuesController.view.frame = CGRect(x: 0, y: 0, width: 740, height: 500)
        issuesController.view.center = view.center
        issuesController.view.layer.cornerRadius = 5
        issuesController.view.layer.masksToBounds = true
        addChildViewController(issuesController)
        view.addSubview(issuesController.view)
        issuesController.didMove(toParentViewController: self)
    }

}
