//
//  aCollectionViewCell.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/16.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit
import SnapKit


protocol DDDDiaryListCellType {
    func cellDate() -> String
    func cellTime() -> String
    func cellTitle() -> String
    func cellDesc() -> String
    func cellStatus() -> String
    func cellWeather() -> WeatherType
    func cellMood() -> MoodType
    func cellLocation() -> LocationStatusType
    func cellAccesory() -> AccessoryStatusType
}

class DDDDiaryListCell: UICollectionViewCell {

    //MARK:- view life cycle
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(dateLable)
        containerView.addSubview(timeLable)
        containerView.addSubview(titleLable)
        containerView.addSubview(descLable)
        containerView.addSubview(statusLable)
        containerView.addSubview(weatherImage)
        containerView.addSubview(moodImage)
        containerView.addSubview(accessoryImage)
        containerView.addSubview(locationImage)
        p_layoutSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Layout
    
    let CellVerticalMargin:NSInteger = 6
    let CellHorizonMargin:NSInteger = 20
    let DateLeftMargin:NSInteger = 12
    let DateTopMargin:NSInteger = 8
    let TimeLeftMargin:NSInteger = 8
    let TimeTopMargin:NSInteger = 8
    let IconRightMargin:NSInteger = 12
    let AccesoryRightMargin:NSInteger = 20
    
    private func p_layoutSubViews(){
        
        containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(CellVerticalMargin)
            make.bottom.equalTo(self).offset(-CellVerticalMargin)
            make.left.equalTo(self).offset(CellHorizonMargin)
            make.right.equalTo(self).offset(-CellHorizonMargin)
        }
        
        dateLable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(containerView).offset(DateTopMargin)
            make.left.equalTo(containerView).offset(DateLeftMargin)
//            make.width.equalTo(40)
//            make.height.equalTo(40)
        }
        
        statusLable.snp.makeConstraints { (make) -> Void in
//            make.top.equalTo(dateLable.snp.bottom).offset(4)
            make.bottom.equalTo(containerView).offset(-4)
            make.centerX.equalTo(dateLable)
        }
        
        timeLable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(containerView).offset(TimeTopMargin)
            make.left.equalTo(dateLable.snp.right).offset(TimeLeftMargin)
            make.right.equalTo(weatherImage.snp.left).offset(5)
        }
        
        titleLable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(timeLable.snp.bottom).offset(3)
            make.left.equalTo(timeLable)
            make.right.equalTo(timeLable)
        }
        
        descLable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLable.snp.bottom).offset(6)
            make.left.equalTo(timeLable)
            make.right.equalTo(timeLable)
        }
        
        locationImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLable)
            make.right.equalTo(containerView).offset(IconRightMargin)
            make.width.equalTo(22)
            make.height.equalTo(22)
        }
        
        moodImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(locationImage)
            make.right.equalTo(locationImage.snp.left).offset(-2)
            make.size.equalTo(locationImage)
        }
        
        weatherImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(locationImage)
            make.right.equalTo(moodImage.snp.left).offset(-2)
            make.size.equalTo(locationImage)
        }
        
        accessoryImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(locationImage.snp.bottom).offset(10)
            make.right.equalTo(containerView).offset(-AccesoryRightMargin)
            make.width.equalTo(22)
            make.width.equalTo(24)
        }
        
    }

//MARK:- setModel
    
    func setModel(model:DDDDiaryListCellType) {
        dateLable.text = model.cellDate()
        timeLable.text = model.cellTime()
        titleLable.text = model.cellTitle()
        descLable.text = model.cellDesc()
        statusLable.text = model.cellStatus()
        
        switch model.cellWeather() {
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
        
        switch model.cellMood() {
        case .Happy:
            break
        case .Normal:
            break
        case .Sad:
            break
        }
        
        switch model.cellLocation() {
        case .Defined:
            break
        case .Undefined:
            break
        }
        
        switch model.cellAccesory() {
        case .Defined:
            break
        case .Undefined:
            break
        }
    }
    
    
//MARK:- getter and setter
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 4
//        view.layer.masksToBounds = true
//        view.layer.shadowColor = UIColor.green.cgColor
//        view.layer.shadowOffset = CGSize(width: 2, height: 2)
//        view.layer.shadowOpacity = 0.8
//        view.layer.shadowRadius = 2
        return view
    }()
    
    lazy var dateLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 46)
        lable.textAlignment = .center
        return lable
    }()
    
    lazy var timeLable:UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 12)
        return lable
    }()
    
    lazy var titleLable:UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 23)
        return lable
    }()
    
    lazy var descLable:UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 12)
        return lable
    }()
    
    lazy var statusLable:UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.textAlignment = .center
        return lable
    }()
    
    lazy var weatherImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var moodImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var accessoryImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var locationImage:UIImageView = {
        let image = UIImageView()
        return image
    }()
}
