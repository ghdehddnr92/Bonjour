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
    
    @IBOutlet weak var DatePicker: UITextField!
    @IBOutlet weak var locationPickerButton: UIButton!
    @IBOutlet weak var travelContentTextField: UITextField!{
        didSet{
            travelContentTextField.tag = 1
            travelContentTextField.becomeFirstResponder()
            travelContentTextField.delegate = self
        }
    }
    
    @IBOutlet weak var selectPhtotoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        selectPhtotoImage.image = selectImageTmp
        createDatePicker()
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
    func createDatePicker()
    {
        datePicker.datePickerMode = .date
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        if let DatePicker = DatePicker{
            DatePicker.inputAccessoryView = toolbar
            DatePicker.inputView = datePicker
        }
    }
   
    @objc func donePressed()
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        let dateString =
            dateFormatter.string(from: datePicker.date)
        if let DatePicker = DatePicker{
            DatePicker.text = "\(dateString)"
        }
        
        self.view.endEditing(true)
    }
    
}
