//
//  DialogTableViewCell.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 16..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class DialogTableViewCell: UITableViewCell {

    @IBOutlet weak var countryImage1: UIImageView!
    @IBOutlet weak var countryLabel1: UILabel!
    
    @IBOutlet weak var countryImage2: UIImageView!
    @IBOutlet weak var countryLabel2: UILabel!
    
    @IBOutlet weak var countryImage3: UIImageView!
    @IBOutlet weak var countryLabel3: UILabel!
    
    @IBOutlet weak var countryImage4: UIImageView!
    @IBOutlet weak var countryLabel4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
