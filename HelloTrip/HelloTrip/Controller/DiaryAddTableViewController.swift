//
//  DiaryAddTableViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 21..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import CoreData

class DiaryAddTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate
{
    var diary:DiaryMO!
   
    @IBOutlet weak var DatePicker: UITextField!
    
    @IBOutlet weak var diaryContentTextField: UITextField!  {
        didSet{
            diaryContentTextField.tag = 1
            diaryContentTextField.becomeFirstResponder()
            diaryContentTextField.delegate = self
        }
    }
    
    @IBOutlet weak var locationSelectButton: UIButton!
    @IBOutlet weak var selectPhotoImage: UIImageView!
    var selectImageTmp: UIImage? = nil
    let datePicker = UIDatePicker()
    //var DatePicker: UITextField? = nil
  
    @IBOutlet weak var travelContentTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        selectPhotoImage.image = selectImageTmp
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            diary = DiaryMO(context: appDelegate.persistentContainer.viewContext)
            
            diary.content = diaryContentTextField.text
            
            if let travelContentImage = selectPhotoImage.image{
                diary.image = UIImagePNGRepresentation(travelContentImage)
            }

            print("Saving data to context ...")
            appDelegate.saveContext()
            
        }
        saveDiary()
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
    func saveDiary(){
        self.performSegue(withIdentifier: "saveDiarySegue", sender: self)
    }
    
}

