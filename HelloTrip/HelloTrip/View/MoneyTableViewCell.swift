//
//  MoneyTableViewCell.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 21..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {

    @IBOutlet weak var spendItem: UILabel!
    @IBOutlet weak var changeBeforeMoney: UILabel!
    @IBOutlet weak var changeBeforeRate: UILabel!
    @IBOutlet weak var changeAfterMoney: UILabel!
    @IBOutlet weak var changeAfterRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
