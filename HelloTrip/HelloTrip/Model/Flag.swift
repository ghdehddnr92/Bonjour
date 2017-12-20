//
//  Flag.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 20..
//  Copyright © 2017년 SSU. All rights reserved.
//

import Foundation

class Flag{
    var fullName: String
    var changeName: String
    var shortenName: String
    var exchangeRate: Float
    
    init(fullName: String, changeName:String, shortenName:String, exchangeRate:Float) {
        self.fullName = fullName
        self.changeName = changeName
        self.shortenName = shortenName
        self.exchangeRate = exchangeRate
    }
    
    convenience init(){
        self.init(fullName:"",changeName:"",shortenName:"",exchangeRate:1)
    }
}
