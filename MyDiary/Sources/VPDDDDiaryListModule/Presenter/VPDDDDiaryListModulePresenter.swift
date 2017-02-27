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
}