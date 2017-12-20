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

    let flags : [Flag] = MyData.Container.flags
    
    @IBOutlet weak var calendar: FSCalendar!
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    @IBOutlet weak var countryView: UIView!
    
    var dateStartFlag:Bool = true
    var startDate:Date? = nil
    var endDate:Date? = nil
    var arrayDate:[Date] = []
    
    var _selectCountryIndex: Int = -1
    var setCalendarImageFlag:Bool = false
    
    //선택된 국가의 배열의 Index
    var selectCountryIndex: Int{
        get{
            //if let _selectCountryIndex = _selectCountryIndex{
                return _selectCountryIndex
            //}
        }
        set(newValue){
            _selectCountryIndex = newValue
        }
    }
    
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

        print("값 : \(selectCountryIndex)")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        //print(date+(3600*24)) //문제 해결 !!!!!
        if dateStartFlag == true{
            startDate = date
            dateStartFlag = false
        }
        else{
            endDate = date
            dateStartFlag = true
            selectTripTimeRange(startDate: startDate!, endDate: endDate!)
            for i in 0 ..< arrayDate.count {
                calendar.select(arrayDate[i])
            }
           
        }
    }
    
    func selectTripTimeRange(startDate: Date, endDate: Date) {
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

        // 국가 선택 함수 호출
        selectTripCountry()
    }
    
    func selectTripCountry(){
        self.performSegue(withIdentifier: "countrySelectSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "countrySelectSegue" {
            let destinationController = segue.destination as! DialogViewController
            
            destinationController.arrayDate = arrayDate
        }
    }
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage?{
        if selectCountryIndex != -1{
            return arrayDate.contains(date) ? UIImage(named: flags[selectCountryIndex].shortenName) : nil
        }
        return nil
    }
}
