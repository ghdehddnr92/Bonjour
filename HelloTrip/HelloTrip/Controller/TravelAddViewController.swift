//
//  TravelAddViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class TravelAddViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
{
    var home:HomeMO!
    
    var selectImageTmp: UIImage? = nil
    let datePicker = UIDatePicker()
    //var DatePicker: UITextField? = nil
    
    
    @IBOutlet weak var travelDateLabel: UILabel!
    @IBOutlet weak var travelCountryLabel: UILabel!
    @IBOutlet weak var travelTitleTextField: UITextField!
    @IBOutlet weak var selectPhtotoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        selectPhtotoImage.image = selectImageTmp
    
        // Do any additional setup after loading the view.
    }
   
    @IBAction func saveAction(_ sender: Any) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            home = HomeMO(context: appDelegate.persistentContainer.viewContext)
            
            
            print("Saving data to context ...")
            appDelegate.saveContext()
            
        }
          dismiss(animated: true, completion: nil)
    }
}
