//
//  IssuesVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class IssuesVC: RootVC, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var IBtableView : UITableView!
    @IBOutlet weak var IBrepoName : UILabel!

    var welRepo : RepoObject!
    var welIssues = Array<IssueObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getIssues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getIssues() {
        APIManagerImplement.getRepoIssues(repoName: welRepo.welName!) { (result, error) in
            if error == nil {
                if let issues = result as? Array<IssueObject> {
                    self.welIssues = issues
                    self.IBtableView.reloadData()
                }
            } else {
                self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welIssues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test")
        return cell!
    }
}
