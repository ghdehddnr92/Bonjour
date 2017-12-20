//
//  TravelAddViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class TravelAddViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate
 {
    @IBOutlet weak var selectPhotoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectPhotoImage.image = selectedImage
            selectPhotoImage.contentMode = .scaleAspectFill
            selectPhotoImage.clipsToBounds = true
        }
        dismiss(animated: true, completion: nil)
    }
}
