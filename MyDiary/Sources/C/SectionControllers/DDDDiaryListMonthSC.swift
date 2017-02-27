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

class DDDDiaryListMonthSC: IGListSectionController,IGListSectionType {
    
    var monthItem: DiaryListMonthViewModel?
    
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
        self.monthItem = object as? DiaryListMonthViewModel
    }
    
    func didSelectItem(at index: Int) {
        
    }


}
