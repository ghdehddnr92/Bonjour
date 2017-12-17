//
//  ViewController.swift
//  HelloTrip
//
//  Created by 가민경 on 2017. 11. 17..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import SideMenu
import CoreData

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, NSFetchedResultsControllerDelegate{
    
    var searchController: UISearchController!
    var fetchResultController: NSFetchedResultsController<HomeMO>!
    
    var searchResults:[HomeMO] = [] // 찾았을때 넣는 배열
    var trips:[HomeMO] = [] // DB 배열
    
    let flags = ["ad","ae","af","ag","al","am","ao","ar","at","au","az","ba","bb","bd","be","bf","bg","bh","bi","bj","bn","bo","br","bs","bt","bw","by","bz","ca","cd","cf","cg","ch","ci","cl","cm","cn","co","cr","cu","cv","cy","cz","de","dj","dk","dm","do","dz","ec","ee","eg","eh","er","es","et","fi","fj","fm","fr","ga","gb","gd","ge","gh","gm","gn","gq","gr","gt","gw","gy","hn","hr","ht","hu","id","ie","il","in","iq","ir","is","it","jm","jo","jp","ke","kg","kh","ki","km","kn","kp","kr","ks","kw","kz","la","lb","lc","li","lk","lr","ls","lt","lu","lv","ly","ma","mc","md","me","mg","mh","mk","ml","mm","mn,","mr","mt","mu","mv","mw","mx","my","mz","na","ne","ng","ni","nl","no","np","nr","nz","om","pa","pe","pg","ph","pk","pl","pt","pw","py","qa","ro","rs","ru","rw","sa","sb","sc","sd","se","sg","si","sk","sl","sm","sn","so","sr","st","sv","sy","sz","td","tg","th","tj","tl","tm","tn","to","tr","tt","tv","tw","tz","ua","ug","us","uy","uz","va","vc","ve","vn","vu","ws","ye","za","zm","zw"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flagCell", for: indexPath) as! FlagCollectionViewCell
        
        return cell
    }

    @IBOutlet weak var FlagCollectionView: UICollectionView!
    @IBOutlet weak var backgroundBlack: UIImageView!
    @IBOutlet var floatbutton: UIButton!
    @IBOutlet var tableView: UITableView!
    var sidebarView: SidebarView!
    var blackScreen: UIView!
   
    var isSearchClicked:Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
     //   FlagCollectionView.delegate = self
     //   FlagCollectionView.dataSource = self
        
        // left Button Side bar
        let btnMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(btnMenuAction))

        btnMenu.tintColor=UIColor(red: 54/255, green: 55/255, blue: 56/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = btnMenu

        sidebarView=SidebarView(frame: CGRect(x: 0, y: 0, width: 0, height: self.view.frame.height))
        sidebarView.delegate=self
        sidebarView.layer.zPosition=100
        
        self.view.isUserInteractionEnabled=true
        self.navigationController?.view.addSubview(sidebarView)

        blackScreen=UIView(frame: self.view.bounds)
        blackScreen.backgroundColor=UIColor(white: 0, alpha: 0.5)
        blackScreen.isHidden=true
        self.navigationController?.view.addSubview(blackScreen)
        blackScreen.layer.zPosition=99
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(blackScreenTapAction(sender:)))
        blackScreen.addGestureRecognizer(tapGestRecognizer)

        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        navigationController?.hidesBarsOnSwipe = true
        // Set up a cool background image for demo purposes
        let newPinkColor = UIColor(red: 255, green: 192, blue: 203)
        SideMenuManager.default.menuAnimationBackgroundColor = newPinkColor
        
        // Fetch data from data store
        let fetchRequest: NSFetchRequest<HomeMO> = HomeMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest,managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    trips = fetchedObjects }
            }
            catch {
                print(error)
            }
        }
        
    }
    
    @objc func btnMenuAction() {
        blackScreen.isHidden=false
        UIView.animate(withDuration: 0.3, animations: {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 250, height: self.sidebarView.frame.height)
        }) { (complete) in
            self.blackScreen.frame=CGRect(x: self.sidebarView.frame.width, y: 0, width: self.view.frame.width-self.sidebarView.frame.width, height: self.view.bounds.height+100)
        }
    }
    @objc func blackScreenTapAction(sender: UITapGestureRecognizer) {
        blackScreen.isHidden=true
        blackScreen.frame=self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
          let cellIdentifier = "HomeCell"
          let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.tripNameLabel.text = trips[indexPath.row].title
        cell.tripTimeLabel.text = trips[indexPath.row].date
        
        if let tripImage = trips[indexPath.row].image{
                cell.Thumbnailimage.image = UIImage(data:tripImage)
        }
      
        return cell
    }
    
    //스와이프 함수
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action, sourceView, completionHandler)in

            self.trips.remove(at: indexPath.row)

            self.tableView.deleteRows(at: [indexPath], with: .fade)

            completionHandler(true)
        }

        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green : 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        //deleAction.image = UIImage(named: "delete")
        let swipeConfiguration = UISwipeActionsConfiguration(actions:[deleteAction])

        return swipeConfiguration
    }
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
            
        }
        if let fetchedObjects = controller.fetchedObjects {
            trips = fetchedObjects as! [HomeMO]
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}

extension HomeViewController: SidebarViewDelegate {
    func sidebarDidSelectRow(row: Row) {
        blackScreen.isHidden=true
        blackScreen.frame=self.view.bounds
        UIView.animate(withDuration: 0.3) {
            self.sidebarView.frame=CGRect(x: 0, y: 0, width: 0, height: self.sidebarView.frame.height)
        }
        switch row {
            //액션 이벤트 여기다 하면 됨
        case .editProfile:
            let vc=EditProfileViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .messages:
            print("Messages")
        case .contact:
            print("Contact")
        case .settings:
            print("Settings")
        case .history:
            print("History")
        case .help:
            print("Help")
        case .signOut:
            print("Sign out")
        case .none:
            break
        }
    }
}
