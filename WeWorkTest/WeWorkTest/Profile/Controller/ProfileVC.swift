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
    @IBOutlet weak var IBfollowers : UILabel!
    @IBOutlet weak var IBfollowing : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        getRepos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        
        IBfollowers.layer.masksToBounds = true
        IBfollowers.layer.cornerRadius = IBfollowers.frame.width / 2
        IBfollowing.layer.masksToBounds = true
        IBfollowing.layer.cornerRadius = IBfollowing.frame.width / 2
    }
    
    func getRepos() {
        APIManagerImplement.getRepos { (repos, error) in
            if error == nil {
                
            } else {
                self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "test", for: indexPath)
        return cell
    }
}
