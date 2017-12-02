//
//  CalendarViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 11. 24..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    @IBOutlet weak var calendar: FSCalendar!
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
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
      
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

    }
    
    func showRange(between startDate: Date, and endDate: Date) {
        // Make sure startDate is smaller, than endDate
        guard startDate < endDate else { return }
        
        // Get the current calendar, i think in your case it should some fscalendar instance
        let calendar = Calendar.current
        // Calculate the endDate for your current calendar
        let calendarEndDate = calendar.startOfDay(for: endDate)
        
        // Lets create a variable, what we can increase day by day
        var currentDate = calendar.startOfDay(for: startDate)
        
        // Run a loop until we reach the end date
        while(currentDate <= calendarEndDate) {
            // Print the current date
            print(currentDate)
            // Add one day at the time
            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }
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
