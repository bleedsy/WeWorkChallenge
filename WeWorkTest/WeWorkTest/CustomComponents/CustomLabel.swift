//
//  CustomLabel.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    func setCircular() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.width / 2
    }
}
