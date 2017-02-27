//
//  OneSectionController.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/16.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit
import IGListKit



class DDDDiaryListDiarySC:IGListSectionController, IGListSectionType  {
    
    var diaryItem: DiaryListDayViewModel?

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
        self.diaryItem = object as? DiaryListDayViewModel
    }

    func didSelectItem(at index: Int) {
        
    }
}
