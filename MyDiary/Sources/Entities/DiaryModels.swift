//
//  DiaryModels.swift
//  MyDiary
//
//  Created by MUJICC on 17/2/27.
//  Copyright © 2017年 Ddd. All rights reserved.
//

import UIKit

class DiaryModels: NSObject {

}


class DiaryListDayModel: NSObject {
    let date: String
    let time: String
    let title: String
    let desc: String
    let status: String
    let weatherType: WeatherType
    let moodType: MoodType
    let accessoryType: AccessoryStatusType
    let locationType: LocationStatusType
    
    init(
        date: String,
        time: String,
        title: String,
        desc: String,
        status: String,
        weatherType: WeatherType,
        moodType: MoodType,
        accessoryType: AccessoryStatusType,
        locationType: LocationStatusType
        ) {
        self.date = date
        self.time = time
        self.title = title
        self.desc = desc
        self.status = status
        self.weatherType = weatherType
        self.moodType = moodType
        self.locationType = locationType
        self.accessoryType = accessoryType
    }
}

class DiaryListMonthModel: NSObject {
    let month: MonthEnum
    
    init(
        month: MonthEnum
        ) {
        self.month = month
    }
    
}




//func setModel(model:DDDDiaryListCellType) {
//    dateLable.text = model.cellDate()
//    timeLable.text = model.cellTime()
//    titleLable.text = model.cellTitle()
//    descLable.text = model.cellDesc()
//    statusLable.text = model.cellStatus()
//    
//    switch model.cellWeather() {
//    case .Sunny:
//        break
//    case .Cloudy:
//        break
//    case .Windy:
//        break
//    case .Rainy:
//        break
//    case .Snowy:
//        break
//    case .Foggy:
//        break
//    }
//    
//    switch model.cellMood() {
//    case .Happy:
//        break
//    case .Normal:
//        break
//    case .Sad:
//        break
//    }
//    
//    switch model.cellLocation() {
//    case .Defined:
//        break
//    case .Undefined:
//        break
//    }
//    
//    switch model.cellAccesory() {
//    case .Defined:
//        break
//    case .Undefined:
//        break
//    }
//}


//protocol DDDDiaryListCellType {
//    func cellDate() -> String
//    func cellTime() -> String
//    func cellTitle() -> String
//    func cellDesc() -> String
//    func cellStatus() -> String
//    func cellWeather() -> WeatherType
//    func cellMood() -> MoodType
//    func cellLocation() -> LocationStatusType
//    func cellAccesory() -> AccessoryStatusType
//}

//protocol DDDDiaryListMonthCellType {
//    func cellMonth() -> MonthEnum
//}
