//
//  ProfileVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileVC: RootVC, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var IBavatar : UIImageView!
    @IBOutlet weak var IBusername : UILabel!
    @IBOutlet weak var IBname : UILabel!
    @IBOutlet weak var IBbio : UILabel!
    @IBOutlet weak var IBcollectionView : UICollectionView!
    @IBOutlet weak var IBfollowers : CustomLabel!
    @IBOutlet weak var IBfollowing : CustomLabel!
    
    var welRepos = Array<RepoObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        getRepos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UI Setup
    // Setup profile UI elements
    func setUpUI() {
        if UserInfo.currentUser.welAvatarURL != nil {
            let url = URL(string: UserInfo.currentUser.welAvatarURL!)
            IBavatar.kf.setImage(with: url)
            IBavatar.layer.masksToBounds = true
            IBavatar.layer.cornerRadius = 5
        }
        
        IBusername.text = UserInfo.currentUser.welLogin
        IBname.text = UserInfo.currentUser.welName
        IBbio.text = UserInfo.currentUser.welBio
        IBfollowers.text = String(format: "%i", UserInfo.currentUser.welFollowers)
        IBfollowing.text = String(format: "%i", UserInfo.currentUser.welFollowing)
        // Custom method to make label circular
        IBfollowers.setCircular()
        IBfollowing.setCircular()
    }
    
    //MARK: API Call
    
    func getRepos() {
        APIManagerImplement.getRepos { (repos, error) in
            if error == nil {
                if let userRepos = repos as? Array<RepoObject> {
                    self.welRepos = userRepos
                    self.IBcollectionView.reloadData()
                }
            } else {
                self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
            }
        }
    }
    
    //MARK: CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return welRepos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
        return cell
    }
}
