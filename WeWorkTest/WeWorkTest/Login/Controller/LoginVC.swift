//
//  LoginVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class LoginVC: RootVC {
    
    @IBOutlet weak var IBusername : UITextField!
    @IBOutlet weak var IBpassword : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            showLoadingView()
            APIManagerImplement.getUserInfo(completion: { (result, error) in
                self.hideLoadingView()
                if error == nil {
                    
                } else {
                    self.showStandardAlert("Error", message: error?.localizedDescription, style: .alert)
                }
            })
        } else {
            showStandardAlert("Check field", message: checkFields(), style: .alert)
        }
    }
}
