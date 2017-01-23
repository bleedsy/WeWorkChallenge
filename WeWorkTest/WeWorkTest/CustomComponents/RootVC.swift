//
//  RootVC.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/22/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit
import MBProgressHUD

class RootVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Gets view controller from storyboard
    func getVCFromStoryboard(_ storyboard: String, viewController: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewController)
        return vc
    }
    
    //MARK: Alerts
    func showStandardAlert(_ title: String?, message: String?, style: UIAlertControllerStyle, completion:(() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true) {
            _ = completion
        }
    }
    
    func showAlertWithButtons(_ title: String?, message: String?, style: UIAlertControllerStyle, actions: [UIAlertAction], completion:(() -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alert.addAction(action)
        }
        self.present(alert, animated: true) {
            _ = completion
        }
    }
    
    //MARK: HUD Loading View
    func showLoadingView() {
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            MBProgressHUD.showAdded(to: window, animated: true)
        }
    }
    
    func hideLoadingView() {
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            MBProgressHUD.hide(for: window, animated: true)
        }
    }
}
