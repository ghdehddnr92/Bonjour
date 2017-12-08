//
//  HomeTableViewCell.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 11. 24..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet var Thumbnailimage : UIImageView!
 
    @IBOutlet weak var tripNameLabel: UILabel!
    
    @IBOutlet weak var tripTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
