//
//  ViewController.swift
//  HelloTrip
//
//  Created by 가민경 on 2017. 11. 17..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var floatbutton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    @IBAction func openMenu(_ sender: Any) {
        if(menuShowing){
            leadingConstraint.constant = -140
        }
        else{
            leadingConstraint.constant = 0
        }
        menuShowing = !menuShowing
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
          let cellIdentifier = "HomeCell"
          let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        return cell
    }
    
    

}

