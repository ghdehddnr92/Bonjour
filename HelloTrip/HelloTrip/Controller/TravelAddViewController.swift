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
    var selectImageTmp: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectPhotoImage.image = selectImageTmp
        // Do any additional setup after loading the view.
    }
}
