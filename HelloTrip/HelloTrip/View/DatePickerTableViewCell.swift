//
//  DatePickerTableViewCell.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class DatePickerTableViewCell: UITableViewCell {


    @IBOutlet weak var datePicker: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
