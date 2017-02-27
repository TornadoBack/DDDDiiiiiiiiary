//
// Created by VIPER
// Copyright (c) 2017 VIPER. All rights reserved.
//

import Foundation

class VPDDDDiaryListModuleInteractor: VPDDDDiaryListModuleInteractorInputProtocol
{
    weak var presenter: VPDDDDiaryListModuleInteractorOutputProtocol?
    var APIDataManager: VPDDDDiaryListModuleAPIDataManagerInputProtocol?
    var localDatamanager: VPDDDDiaryListModuleLocalDataManagerInputProtocol?
    
    init() {}
    
    func fetchUpdateData() {
        
            let demos = [
                DiaryListMonthModel(month: .Oct),
                DiaryListDayModel(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined),
                DiaryListDayModel(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined),
                DiaryListMonthModel(month: .Jan),
                DiaryListDayModel(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined),
                DiaryListDayModel(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined)
                ] as [Any]
        
        presenter?.onSuccessData(demos)
        
        
        
    }
}
