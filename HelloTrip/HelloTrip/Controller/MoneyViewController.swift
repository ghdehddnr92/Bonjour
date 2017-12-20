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
    var selectDate: Date? = nil
    var totalMoney: String = "300"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.dataSource = self
        calendar.delegate = self
        calendar.swipeToChooseGesture.isEnabled = true
        
        let newPinkColor = UIColor(red: 255, green: 192, blue: 203)
        calendar.appearance.headerTitleColor = newPinkColor
        calendar.appearance.weekdayTextColor = newPinkColor
        calendar.appearance.selectionColor = newPinkColor
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //dialog
        //blabla
        selectDate = date
        selectMoneyDate()
        //print("선택한 날짜 :\(selectDate)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moneySegue" {
            let destinationController = segue.destination as! MoneyDialogViewController
             destinationController.selectDate = selectDate
        }
    }
    func selectMoneyDate(){
        self.performSegue(withIdentifier: "moneySegue", sender: self)
    }
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        //print("선택한 날짜 :\(selectDate)")
        if selectDate != nil{
            return selectDate == date ? totalMoney : nil
        }
        return nil
    }
}
