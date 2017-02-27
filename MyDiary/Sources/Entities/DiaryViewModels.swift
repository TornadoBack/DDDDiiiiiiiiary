//
//  DiaryViewModels.swift
//  MyDiary
//
//  Created by MUJICC on 17/2/27.
//  Copyright © 2017年 Ddd. All rights reserved.
//

import UIKit
import IGListKit

class DiaryViewModels: NSObject {

}


class DiaryListDayViewModel: NSObject {
    var date: String
    var time: String
    var title: String
    var desc: String
    var status: String
    var weatherImage: UIImage?
    var moodImage: UIImage?
    var accessoryImage: UIImage?
    var locationImage: UIImage?
    var controllerClass: UIViewController.Type?
    
    init(
        date: String,
        time: String,
        title: String,
        desc: String,
        status: String,
        weatherImage: UIImage?,
        moodImage: UIImage?,
        accessoryImage: UIImage?,
        locationImage: UIImage?,
        controllerClass:UIViewController.Type?
        ) {
        self.date = date
        self.time = time
        self.title = title
        self.desc = desc
        self.status = status
        self.weatherImage = weatherImage
        self.moodImage = moodImage
        self.locationImage = locationImage
        self.accessoryImage = accessoryImage
        self.controllerClass = controllerClass
    }
    
    class func viewModelFromModel(_ model:DiaryListDayModel) -> DiaryListDayViewModel{
        let vModel = DiaryListDayViewModel(date: "", time: "", title: "", desc: "", status: "", weatherImage: nil, moodImage: nil, accessoryImage: nil, locationImage: nil, controllerClass: nil)
        vModel.date = model.date
        vModel.time = model.time
        vModel.title = model.title
        vModel.desc = model.desc
        vModel.status = model.status
        
            switch model.weatherType {
            case .Sunny:
                break
            case .Cloudy:
                break
            case .Windy:
                break
            case .Rainy:
                break
            case .Snowy:
                break
            case .Foggy:
                break
            }
        
            switch model.moodType {
            case .Happy:
                break
            case .Normal:
                break
            case .Sad:
                break
            }
        
            switch model.locationType {
            case .Defined:
                break
            case .Undefined:
                break
            }
            
            switch model.accessoryType {
            case .Defined:
                break
            case .Undefined:
                break
            }
    
    return vModel
        
    }
    
    
    
}

extension DiaryListDayViewModel:IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        
        guard let object = object as? DiaryListDayViewModel else {
            return false
        }
        
        return controllerClass == object.controllerClass
            && date == object.date
            && time == object.time
            && title == object.title
            && desc == object.desc
            && status == object.status
            && weatherImage == object.weatherImage
            && moodImage == object.moodImage
            && locationImage == object.locationImage
            && accessoryImage == object.accessoryImage
    }
}


class DiaryListMonthViewModel: NSObject {
    let month: String
    
    init(
        month: String
        ) {
        self.month = month
    }
    
    class func viewModelFromModel(_ model:DiaryListMonthModel) -> DiaryListMonthViewModel {
        
    let vModel = DiaryListMonthViewModel(month: model.month.rawValue)
    
    return vModel
    
    }

}

extension DiaryListMonthViewModel:IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return month as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        
        guard let object = object as? DiaryListMonthViewModel else {
            return false
        }
        
        return month == object.month
    }
}
