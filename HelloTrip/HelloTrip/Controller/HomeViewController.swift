//
//  ViewController.swift
//  HelloTrip
//
//  Created by 가민경 on 2017. 11. 17..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import Floaty

class HomeViewController: UIViewController {

    @IBOutlet var floatbutton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view, typically from a nib.
//        let floaty = Floaty()
//
//        floaty.buttonColor = UIColor.purple
//        floaty.plusColor = UIColor.white
//
//       // floaty.addItem(title: "Hello, World!")
//        self.view.addSubview(floaty)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) {
        let cell = UITableViewCell()
        cell.textField?.text = "\(indexPath.row)"
        return cell
    }
    
    

}

