//
//  ProfileVC+PopUpView.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/26/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

extension ProfileVC {

    // Add Nav controller and dim overlay
    func showIssues(repo: RepoObject) {
        // Create overlay and add as subview
        welDimOverlay = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        welDimOverlay.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.50)
        view.addSubview(welDimOverlay)
        
        // Get nav controller from storyboard
        welIssuesNavController = getVCFromStoryboard("Main", viewController: "IssuesNavController") as! UINavigationController
        // Setup view controller
        welIssuesController = welIssuesNavController.viewControllers.first as! IssuesVC
        welIssuesController.welDelegate = self
        welIssuesController.welRepo = repo
        // Setup nav controller
        welIssuesNavController.view.frame = CGRect(x: 0, y: 0, width: 740, height: 500)
        welIssuesNavController.view.center = view.center
        welIssuesNavController.view.layer.cornerRadius = 5
        welIssuesNavController.view.layer.masksToBounds = true
        // Add nav controller
        addChildViewController(welIssuesNavController)
        view.addSubview(welIssuesNavController.view)
        welIssuesNavController.didMove(toParentViewController: self)
    }
    
    //MARK: Issues Delegate
    // Remove dim overlay and nav controller from view controller
    func remove() {
        welIssuesNavController.view.removeFromSuperview()
        welIssuesNavController.removeFromParentViewController()
        welDimOverlay.removeFromSuperview()
    }
}
