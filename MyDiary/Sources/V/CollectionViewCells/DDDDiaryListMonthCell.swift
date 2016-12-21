//
//  DDDDiaryListMonthCell.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/17.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit
import SnapKit

protocol DDDDiaryListMonthCellType {
    func cellMonth() -> MonthEnum
}



class DDDDiaryListMonthCell: UICollectionViewCell {
    //MARK:- view life cycle
    override init(frame:CGRect) {
        super.init(frame: frame)
        p_layoutSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Layout
    
    private func p_layoutSubViews(){
        self.addSubview(monthLable)
        
        monthLable.snp.makeConstraints { (make) -> Void in
            make.center.equalTo(self)
        }
    }
    
    func setModel(model:DDDDiaryListMonthCellType) {
        monthLable.text = model.cellMonth().rawValue
    }
    
    
    //MARK:- getter and setter
    
    lazy var monthLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 25)
        lable.textAlignment = .center
        return lable
    }()
    
}
