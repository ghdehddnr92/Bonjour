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
    @IBOutlet var datelabel : UILabel!
    @IBOutlet var subjectlabel : UILabel!

    var travel:[HomeMO] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
