//
//  KittyViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 11. 29..
//  Copyright © 2017년 SSU. All rights reserved.
//


import UIKit
import InteractiveSideMenu

/*
 KittyViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class KittyViewController: UIViewController, SideMenuItemContent {
    
    /* Show side menu on menu button click
     */
    @IBAction func openMenu(_ sender: UIButton) {
        showSideMenu()
    }
}
