//
//  ProfileVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class ProfileVC: RootVC, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var IBavatar : UIImageView!
    @IBOutlet weak var IBusername : UILabel!
    @IBOutlet weak var IBname : UILabel!
    @IBOutlet weak var IBbio : UILabel!
    @IBOutlet weak var IBcollectionView : UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpUI() {
        
    }
}
