//
//  LoginVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit
import AVFoundation

class LoginVC: RootVC {
    
    @IBOutlet weak var IBusername : UITextField!
    @IBOutlet weak var IBpassword : UITextField!
    
    var welAvPlayer: AVPlayer!
    var welAvPlayerLayer: AVPlayerLayer!
    var welPaused: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpVideoBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func checkFields() -> String? {
        if IBusername.text == "" {
            return "Username cannot be blank"
        } else if IBpassword.text == "" {
            return "Password cannot be blank"
        }
        return nil
    }
    

    @IBAction func login(sender: UIButton) {
        if checkFields() == nil {
            Constants.userInfo.username = IBusername.text!
            Constants.userInfo.password = IBpassword.text!
            showLoadingView()
            APIManagerImplement.getUserInfo(completion: { (result, error) in
                self.hideLoadingView()
                if error == nil {
                    let profileVC = self.getVCFromStoryboard("Main", viewController: "ProfileVC")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.changeRootVC(profileVC)
                } else {
                    if let errorMessage = error as? String {
                        self.showStandardAlert("Error", message: errorMessage, style: .alert)
                    } else {
                        self.showStandardAlert("Error", message: (error as AnyObject).localizedDescription, style: .alert)
                    }
                }
            })
        } else {
            showStandardAlert("Check field", message: checkFields(), style: .alert)
        }
    }
}
