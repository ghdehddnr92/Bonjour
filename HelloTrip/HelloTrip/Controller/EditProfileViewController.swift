//
//  EditProfileViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 1..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(lbl)
        lbl.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        lbl.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        lbl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive=true
        lbl.heightAnchor.constraint(equalToConstant: 60).isActive=true
    }
    let lbl: UILabel = {
        let label=UILabel()
        label.text = "Edit Profile"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
}
