//
//  MoneyDialogViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class MoneyDialogViewController: UIViewController {
    var selectDate: Date? = nil
    
    @IBOutlet weak var moneyFinishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moneyDialogSegue" {
            let destinationController = segue.destination as! MoneyViewController
            destinationController.selectDate = selectDate
        }
    }
    
}
