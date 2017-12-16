//
//  DialogViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 16..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class DialogViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DialogCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DialogTableViewCell
//        cell.tripNameLabel.text = trips[indexPath.row].title
//        cell.tripTimeLabel.text = trips[indexPath.row].date
//
//        if let tripImage = trips[indexPath.row].image{
//            cell.Thumbnailimage.image = UIImage(data:tripImage)
//        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
