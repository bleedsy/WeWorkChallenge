//
//  IssueCell.swift
//  WeWorkTest
//
//  Created by Brandon Leeds on 1/23/17.
//  Copyright © 2017 Brandon Leeds. All rights reserved.
//

import UIKit

class IssueCell: UITableViewCell {
    
    @IBOutlet weak var IBtitle : UILabel!
    @IBOutlet weak var IBbody : UILabel!
    @IBOutlet weak var IBstate : UILabel!
    
    var title : String? {
        didSet {
            IBtitle.text = title
        }
    }
    
    var body : String? {
        didSet {
            IBbody.text = body
        }
    }
    
    var state : String? {
        didSet {
            if state?.lowercased() == "open" {
                IBstate.textColor = UIColor.green
            } else {
                IBstate.textColor = UIColor.red
            }
            IBstate.text = state
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
