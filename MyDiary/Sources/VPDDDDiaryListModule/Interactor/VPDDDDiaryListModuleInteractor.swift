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
}