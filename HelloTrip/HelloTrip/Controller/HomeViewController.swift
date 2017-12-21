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

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate, UISearchResultsUpdating{
  
    var searchController: UISearchController!
    var fetchResultController: NSFetchedResultsController<HomeMO>!
    
    var searchResults:[HomeMO] = [] // 찾았을때 넣는 배열
    var trips:[HomeMO] = [] // DB 배열
    
    @IBOutlet var floatbutton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var blackScreen: UIView!
    var isSearchClicked:Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.isUserInteractionEnabled=true
        
        searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
        
        navigationController?.hidesBarsOnSwipe = true
        
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
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if searchController.isActive {
            return searchResults.count
        } else {
            return trips.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
          let cellIdentifier = "HomeCell"
          let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        
        let trip = (searchController.isActive) ? searchResults[indexPath.row] : trips[indexPath.row]
      
        cell.tripNameLabel.text = trip.title
        cell.tripTimeLabel.text = trip.date
        
        if let tripImage = trips[indexPath.row].image{
            cell.Thumbnailimage.image = UIImage(data:tripImage)
        }
        
        return cell
    }
    
    //스와이프 함수
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action, sourceView, completionHandler) in
    
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                let context = appDelegate.persistentContainer.viewContext
                let tripToDelete = self.fetchResultController.object(at: indexPath)
                context.delete(tripToDelete)
                appDelegate.saveContext()
            }
            completionHandler(true)
        }
     
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green : 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
     
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
    func filterContent(for searchText: String) {
        searchResults = trips.filter({ (home) -> Bool in
            if let name = home.title {
                let isMatch = name.localizedCaseInsensitiveContains(searchText)
                return isMatch
            }
            return false })
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            filterContent(for: searchText)
            tableView.reloadData() }
    }
}
