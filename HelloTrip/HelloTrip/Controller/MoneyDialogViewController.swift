//
//  MoneyDialogViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class MoneyDialogViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    var selectDate: Date? = nil
    
  
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        switch indexPath.row {
        
        case 0 :
            let cellIdentifier = "MoneyAddTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MoneyAddTableViewCell
            
            return cell
        default :
            let cellIdentifier = "MoneyTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MoneyTableViewCell
            
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moneyDialogSegue" {
            let destinationController = segue.destination as! MoneyViewController
            destinationController.selectDate = selectDate
        }
    }
    
}
