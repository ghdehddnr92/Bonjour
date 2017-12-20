//
//  DialogViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 16..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit


class DialogViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{

    //let flags : [String] = MyData.Container.flag
    let flags : [Flag] = MyData.Container.flags
    
    public var clickedImageIndex: Int = -1
    @IBOutlet weak var tableView: UITableView!

    var arrayDate:[Date] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return flags.count/4
        return flags.count/4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DialogCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DialogTableViewCell
        
        for index in 0..<4{
            if index == 0 {
                //cell.countryLabel1.text = flags[(4*indexPath.row)+index]
                cell.countryLabel1.text = flags[(4*indexPath.row)+index].fullName
                cell.countryImage1.image = UIImage(named: flags[(4*indexPath.row)+index].shortenName)
            }
            else if index == 1{
                cell.countryLabel2.text = flags[(4*indexPath.row)+index].fullName
                cell.countryImage2.image = UIImage(named: flags[(4*indexPath.row)+index].shortenName)
            }
            else if index == 2{
                cell.countryLabel3.text = flags[(4*indexPath.row)+index].fullName
                cell.countryImage3.image = UIImage(named: flags[(4*indexPath.row)+index].shortenName)
            }
            else {
                cell.countryLabel4.text = flags[(4*indexPath.row)+index].fullName
                cell.countryImage4.image = UIImage(named: flags[(4*indexPath.row)+index].shortenName)
            }
        }

        let tabGesture1 =  UITapGestureRecognizer(target: self, action: #selector(imgTapped1(sender:)))
        let tabGesture2 =  UITapGestureRecognizer(target: self, action: #selector(imgTapped2(sender:)))
        let tabGesture3 =  UITapGestureRecognizer(target: self, action: #selector(imgTapped3(sender:)))
        let tabGesture4 =  UITapGestureRecognizer(target: self, action: #selector(imgTapped4(sender:)))
        
        cell.countryImage1.isUserInteractionEnabled = true
        cell.countryImage1.addGestureRecognizer(tabGesture1)
        cell.countryImage2.isUserInteractionEnabled = true
        cell.countryImage2.addGestureRecognizer(tabGesture2)
        cell.countryImage3.isUserInteractionEnabled = true
        cell.countryImage3.addGestureRecognizer(tabGesture3)
        cell.countryImage4.isUserInteractionEnabled = true
        cell.countryImage4.addGestureRecognizer(tabGesture4)
        
        return cell
    }
    
    @objc func imgTapped1(sender: UITapGestureRecognizer){
        guard let tappedView = sender.view else {
            return
        }
        let touchPointInTableView = self.tableView.convert(tappedView.center, from: tappedView)
        guard let indexPath = self.tableView.indexPathForRow(at: touchPointInTableView) else {
            return
        }
        tappedView.tintColor = UIColor.black
        self.clickedImageIndex = indexPath.row*4 + 0
        selectCountry()
        print("[\(indexPath.row),1] + \(indexPath.row*4 + 0)")
    }
    @objc func imgTapped2(sender: UITapGestureRecognizer){
        guard let tappedView = sender.view else {
            return
        }
        let touchPointInTableView = self.tableView.convert(tappedView.center, from: tappedView)
        guard let indexPath = self.tableView.indexPathForRow(at: touchPointInTableView) else {
            return
        }
        self.clickedImageIndex = indexPath.row*4 + 1
        selectCountry()
        
        print("[\(indexPath.row),2] + \(indexPath.row*4 + 1)")
    }
    @objc func imgTapped3(sender: UITapGestureRecognizer){
        guard let tappedView = sender.view else {
            return
        }
        let touchPointInTableView = self.tableView.convert(tappedView.center, from: tappedView)
        guard let indexPath = self.tableView.indexPathForRow(at: touchPointInTableView) else {
            return
        }
        self.clickedImageIndex = indexPath.row*4 + 2
        selectCountry()
        print("[\(indexPath.row),3] + \(indexPath.row*4 + 2)")
    }
    @objc func imgTapped4(sender: UITapGestureRecognizer){
        guard let tappedView = sender.view else {
            return
        }
        let touchPointInTableView = self.tableView.convert(tappedView.center, from: tappedView)
        guard let indexPath = self.tableView.indexPathForRow(at: touchPointInTableView) else {
            return
        }
        self.clickedImageIndex = indexPath.row*4 + 3
        selectCountry()
        print("[\(indexPath.row),4] + \(indexPath.row*4 + 3)")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendCountrySegue" {
            let destinationController = segue.destination as! CalendarViewController
            destinationController.selectCountryIndex = clickedImageIndex
            destinationController.arrayDate = arrayDate
        }
    }
    func selectCountry(){
        self.performSegue(withIdentifier: "sendCountrySegue", sender: self)
    }
}
