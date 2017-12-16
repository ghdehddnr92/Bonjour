//
//  DialogViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 16..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit

class DialogViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource{
    
    let flags = ["ad","ae","af","ag","al","am","ao","ar","at","au","az","ba","bb","bd","be","bf","bg","bh","bi","bj","bn","bo","br","bs","bt","bw","by","bz","ca","cd","cf","cg","ch","ci","cl","cm","cn","co","cr","cu","cv","cy","cz","de","dj","dk","dm","do","dz","ec","ee","eg","eh","er","es","et","fi","fj","fm","fr","ga","gb","gd","ge","gh","gm","gn","gq","gr","gt","gw","gy","hn","hr","ht","hu","id","ie","il","in","iq","ir","is","it","jm","jo","jp","ke","kg","kh","ki","km","kn","kp","kr","ks","kw","kz","la","lb","lc","li","lk","lr","ls","lt","lu","lv","ly","ma","mc","md","me","mg","mh","mk","ml","mm","mn,","mr","mt","mu","mv","mw","mx","my","mz","na","ne","ng","ni","nl","no","np","nr","nz","om","pa","pe","pg","ph","pk","pl","pt","pw","py","qa","ro","rs","ru","rw","sa","sb","sc","sd","se","sg","si","sk","sl","sm","sn","so","sr","st","sv","sy","sz","td","tg","th","tj","tl","tm","tn","to","tr","tt","tv","tw","tz","ua","ug","us","uy","uz","va","vc","ve","vn","vu","ws","ye","za","zm","zw"]
    public var clickedImageIndex: Int = -1
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count/4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DialogCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DialogTableViewCell
        
        for index in 0..<4{
            if index == 0 {
                cell.countryLabel1.text = flags[(4*indexPath.row)+index]
                cell.countryImage1.image = UIImage(named: flags[(4*indexPath.row)+index])
            }
            else if index == 1{
                cell.countryLabel2.text = flags[(4*indexPath.row)+index]
                cell.countryImage2.image = UIImage(named: flags[(4*indexPath.row)+index])
            }
            else if index == 2{
                cell.countryLabel3.text = flags[(4*indexPath.row)+index]
                cell.countryImage3.image = UIImage(named: flags[(4*indexPath.row)+index])
            }
            else {
                cell.countryLabel4.text = flags[(4*indexPath.row)+index]
                cell.countryImage4.image = UIImage(named: flags[(4*indexPath.row)+index])
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
        self.clickedImageIndex = indexPath.row*4 + 0
        
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
    
}
