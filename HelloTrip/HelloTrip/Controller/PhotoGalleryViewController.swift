//
//  PhotoGalleryViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 18..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class PhotoGalleryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var selctFinishButton: UIButton!
    @IBOutlet weak var galleryOpenButton: UIButton!
    @IBOutlet weak var selectPhotoImage: UIImageView!
    var selectImageTmp: UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        openGallery()
    }
  
    @IBAction func openGalleryAction(_ sender: Any) {
        openGallery()
    }
    @IBAction func unwindToHome(segue: UIStoryboardSegue){
        dismiss(animated:true, completion:nil)
    }
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage =
        info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectPhotoImage.image = selectedImage
            selectImageTmp = selectedImage
            selectPhotoImage.contentMode = .scaleAspectFill
            selectPhotoImage.clipsToBounds = true
            print(info)
        }
        dismiss(animated: true, completion: nil)
        selectImage()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectImageSegue" {
            let destinationController = segue.destination as! TravelAddViewController
            destinationController.selectImageTmp = selectImageTmp
        }
    }
    func selectImage(){
        self.performSegue(withIdentifier: "selectImageSegue", sender: self)
    }
}
