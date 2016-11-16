//
//  FirstTableViewCell.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
