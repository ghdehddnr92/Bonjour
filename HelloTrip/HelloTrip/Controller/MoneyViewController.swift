//
//  MoneyViewController.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 11. 26..
//  Copyright © 2017년 SSU. All rights reserved.
//

import UIKit
import FSCalendar

struct Exchange: Decodable {
    let date : String
    let name : String
    let rate : Float
}

var MyDiary:DiaryMO!
let flags : [Flag] = MyData.Container.flags

class MoneyViewController: UIViewController ,FSCalendarDelegate, FSCalendarDataSource{
    @IBOutlet weak var calendar: FSCalendar!
    var selectDate: Date? = nil
    var totalMoney: String = "300"
    var current_changeName: String = "KRW"
    var current_exchange_rate: Float = 1.0
    var current_country_shortenName: String = "ko"
    
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
//        if selectDate = MyDiary.date//타입맞추기
//        {
//            for i in flags.count{
//                if flags[i].shortenName == MyDiary.country
//                {
//                    current_change = flags[i].changeName
//                    current_exchange_rate = flags[i].exchangeRate
//                    current_country_shortenName = flags[i].shortenName
//                }
//            }
//        }
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
        //currnet_changeName, exchange, country_shortenName 넘겨주기
    }
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        //print("선택한 날짜 :\(selectDate)")
        if selectDate != nil{
            return selectDate == date ? totalMoney : nil
        }
        return nil
    }
}
