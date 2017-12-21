//
//  TravelAddViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import CoreData

class TravelAddViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
{
    var home:HomeMO!
    
    var selectImageTmp: UIImage? = nil
    let datePicker = UIDatePicker()
    //var DatePicker: UITextField? = nil
    
    
    @IBOutlet weak var travelDateLabel: UILabel!
    @IBOutlet weak var travelCountryLabel: UILabel!
    @IBOutlet weak var travelTitleTextField: UITextField!{
        didSet{
            travelTitleTextField.tag = 1
            travelTitleTextField.becomeFirstResponder()
            travelTitleTextField.delegate = self
        }
    }
    
    @IBOutlet weak var selectPhtotoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        selectPhtotoImage.image = selectImageTmp
    
        // Do any additional setup after loading the view.
    }
   
 
    @IBAction func buttonSaveAction(_ sender: AnyObject) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            home = HomeMO(context: appDelegate.persistentContainer.viewContext)
            home.title = travelTitleTextField.text
            
            if let travelHomeImage = selectPhtotoImage.image{
                home.image = UIImagePNGRepresentation(travelHomeImage)
            }
            
            print("Saving data to context ...")
            appDelegate.saveContext()
        }
     //   saveTravel()
    }
//    func saveTravel(){
//        self.performSegue(withIdentifier: "saveTravelSegue", sender: self)
//    }
}
