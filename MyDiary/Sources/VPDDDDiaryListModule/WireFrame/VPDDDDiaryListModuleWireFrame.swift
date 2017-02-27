//
// Created by VIPER
// Copyright (c) 2017 VIPER. All rights reserved.
//

import UIKit

class VPDDDDiaryListModuleWireFrame: VPDDDDiaryListModuleWireFrameProtocol
{
    class func presentVPDDDDiaryListModuleModule(fromView view: AnyObject)
    {
        // Generating module components
        let view: VPDDDDiaryListModuleViewProtocol = VPDDDDiaryListModuleView()
        let presenter: VPDDDDiaryListModulePresenterProtocol & VPDDDDiaryListModuleInteractorOutputProtocol = VPDDDDiaryListModulePresenter()
        let interactor: VPDDDDiaryListModuleInteractorInputProtocol = VPDDDDiaryListModuleInteractor()
        let APIDataManager: VPDDDDiaryListModuleAPIDataManagerInputProtocol = VPDDDDiaryListModuleAPIDataManager()
        let localDataManager: VPDDDDiaryListModuleLocalDataManagerInputProtocol = VPDDDDiaryListModuleLocalDataManager()
        let wireFrame: VPDDDDiaryListModuleWireFrameProtocol = VPDDDDiaryListModuleWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
    }
    
    class func creatVPDDDDiaryListModuleModule() -> UIViewController {
        let view: VPDDDDiaryListModuleViewProtocol = VPDDDDiaryListModuleView()
        let presenter: VPDDDDiaryListModulePresenterProtocol & VPDDDDiaryListModuleInteractorOutputProtocol = VPDDDDiaryListModulePresenter()
        let interactor: VPDDDDiaryListModuleInteractorInputProtocol = VPDDDDiaryListModuleInteractor()
        let APIDataManager: VPDDDDiaryListModuleAPIDataManagerInputProtocol = VPDDDDiaryListModuleAPIDataManager()
        let localDataManager: VPDDDDiaryListModuleLocalDataManagerInputProtocol = VPDDDDiaryListModuleLocalDataManager()
        let wireFrame: VPDDDDiaryListModuleWireFrameProtocol = VPDDDDiaryListModuleWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
        
        return view as! UIViewController
    }
}
