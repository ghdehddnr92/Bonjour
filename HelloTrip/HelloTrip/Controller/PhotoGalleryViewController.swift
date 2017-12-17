//
//  PhotoGalleryViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 18..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil) }
        // Do any additional setup after loading the view.
    }
}
