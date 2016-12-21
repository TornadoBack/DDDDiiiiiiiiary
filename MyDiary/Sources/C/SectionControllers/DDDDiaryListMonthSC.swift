//
//  DDDDiaryListMonthSC.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/17.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit
import Foundation
import IGListKit

class DDDDiaryListMonthItem {
    
    let month: MonthEnum
    
    init(
        month: MonthEnum
        ) {
        self.month = month
    }
    
}

extension DDDDiaryListMonthItem:IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return month.rawValue as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object {
            return true
        }
        
        guard let object = object as? DDDDiaryListMonthItem else {
            return false
        }
        
        return month == object.month
    }
}

extension DDDDiaryListMonthItem:DDDDiaryListMonthCellType {
    func cellMonth() -> MonthEnum {
        return month
    }
}


class DDDDiaryListMonthSC: IGListSectionController,IGListSectionType {
    
    var monthItem: DDDDiaryListMonthItem?
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 45)
        
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: DDDDiaryListMonthCell.self, for: self, at: index) as! DDDDiaryListMonthCell
        
        guard let aModel = monthItem else {
            return cell
        }
        
        cell.setModel(model: aModel)
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.monthItem = object as? DDDDiaryListMonthItem
    }
    
    func didSelectItem(at index: Int) {
        
    }


}
