//
// Created by VIPER
// Copyright (c) 2017 VIPER. All rights reserved.
//

import Foundation

class VPDDDDiaryListModulePresenter: VPDDDDiaryListModulePresenterProtocol, VPDDDDiaryListModuleInteractorOutputProtocol
{
    weak var view: VPDDDDiaryListModuleViewProtocol?
    var interactor: VPDDDDiaryListModuleInteractorInputProtocol?
    var wireFrame: VPDDDDiaryListModuleWireFrameProtocol?
    
    init() {}
    
    func fetchUpdateData() {
        interactor?.fetchUpdateData()
    }
    
    func onSuccessData(_ data:[Any]) {
        
        var temp:[Any] = [Any]()
        
        for item in data {
            if (item is DiaryListDayModel) {
                let model = DiaryListDayViewModel.viewModelFromModel(item as! DiaryListDayModel)
                temp.append(model)
                
            }
            if (item is DiaryListMonthModel) {
                let model = DiaryListMonthViewModel.viewModelFromModel(item as! DiaryListMonthModel)
                temp.append(model)
            }
        }
        
        
        view?.showView(temp)
    }
}
