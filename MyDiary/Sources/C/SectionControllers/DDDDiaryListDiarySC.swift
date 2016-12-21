//
//  OneSectionController.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/16.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit
import IGListKit


class DDDDiaryListDiaryItem: NSObject {
    
    let date: String
    let time: String
    let title: String
    let desc: String
    let status: String
    let weatherType: WeatherType
    let moodType: MoodType
    let accessoryType: AccessoryStatusType
    let locationType: LocationStatusType
    let controllerClass: UIViewController.Type?
    
    init(
        date: String,
        time: String,
        title: String,
        desc: String,
        status: String,
        weatherType: WeatherType,
        moodType: MoodType,
        accessoryType: AccessoryStatusType,
        locationType: LocationStatusType,
        controllerClass:UIViewController.Type?
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
        self.controllerClass = controllerClass
    }
    
}

extension DDDDiaryListDiaryItem:IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        
        guard let object = object as? DDDDiaryListDiaryItem else {
            return false
        }
        
        return controllerClass == object.controllerClass
                && date == object.date
                && time == object.time
                && title == object.title
                && desc == object.desc
                && status == object.status
                && weatherType == object.weatherType
                && moodType == object.moodType
                && locationType == object.locationType
                && accessoryType == object.accessoryType
    }
}

extension DDDDiaryListDiaryItem:DDDDiaryListCellType {
    func cellDate() -> String {
        return self.date
    }
    func cellTime() -> String {
        return self.time
    }
    func cellTitle() -> String {
        return self.title
    }
    func cellDesc() -> String {
        return self.desc
    }
    func cellStatus() -> String {
        return self.status
    }
    func cellWeather() -> WeatherType {
        return self.weatherType
    }
    func cellMood() -> MoodType {
        return self.moodType
    }
    func cellLocation() -> LocationStatusType {
        return self.locationType
    }
    func cellAccesory() -> AccessoryStatusType {
        return self.accessoryType
    }
}

class DDDDiaryListDiarySC:IGListSectionController, IGListSectionType  {
    
    var diaryItem: DDDDiaryListDiaryItem?

    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
//        let cell = DDDDiaryListCell();
//        cell.lableOne.text = object?.name;
//        cell.lableTwo.text = object?.desc;
//        
//        let size = cell.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
//        return CGSize(width: collectionContext!.containerSize.width, height: size.height)
        return CGSize(width: collectionContext!.containerSize.width, height: 90)
        
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: DDDDiaryListCell.self, for: self, at: index) as! DDDDiaryListCell
        
        guard let aModel = diaryItem else {
            return cell
        }
        
        cell.setModel(model: aModel)
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.diaryItem = object as? DDDDiaryListDiaryItem
    }

    func didSelectItem(at index: Int) {
        
    }
}
