//
//  MoneyViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 11. 26..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import FSCalendar

class MoneyViewController: UIViewController ,FSCalendarDelegate, FSCalendarDataSource{
    @IBOutlet weak var calendar: FSCalendar!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.allowsMultipleSelection = true
        calendar.dataSource = self
        calendar.delegate = self
        calendar.swipeToChooseGesture.isEnabled = true
        
        let newPinkColor = UIColor(red: 255, green: 192, blue: 203)
        calendar.appearance.headerTitleColor = newPinkColor
        calendar.appearance.weekdayTextColor = newPinkColor
        calendar.appearance.selectionColor = newPinkColor
        calendar.scope = .week
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
