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
    
    var dateStartFlag:Bool = true
    var startDate:Date? = nil
    var endDate:Date? = nil
    var arrayDate:[Date] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.allowsMultipleSelection = true
        calendar.dataSource = self
        calendar.delegate = self
        calendar.swipeToChooseGesture.isEnabled = true
        
        let newPinkColor = UIColor(red: 255, green: 192, blue: 203)
        calendar.appearance.headerTitleColor = newPinkColor
        calendar.appearance.weekdayTextColor = newPinkColor
        //calendar.appearance.selectionColor = newPinkColor
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let normalizedStartDate = calendar.startOfDayForDate(fromDate)
//        let normalizedEndDate = calendar.startOfDayForDate(toDate)
//        var dates: NSMutableArray = []
//        var currentDate = normalizedStartDate
//        repeat {
//            currentDate = calendar.dateByAddingUnit(NSCalendarUnit.Day, value: 1, toDate: currentDate, options: NSCalendarOptions.MatchNextTime)!
//            dates.addObject(currentDate)
//        } while !calendar.isDate(currentDate, inSameDayAsDate: normalizedEndDate)
//        print(dates)
        
        //print(date+(3600*24)) //문제 해결 !!!!!
        if dateStartFlag == true{
            startDate = date
            dateStartFlag = false
        }
        else{
            endDate = date
            dateStartFlag = true
            showRange(startDate: startDate!, endDate: endDate!)
            for i in 0 ..< arrayDate.count {
                calendar.select(arrayDate[i])
            }
        }
    }
    
    func showRange(startDate: Date, endDate: Date) {
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
            arrayDate.append(currentDate)
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
