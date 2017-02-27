//
// Created by VIPER
// Copyright (c) 2017 VIPER. All rights reserved.
//

import Foundation

protocol VPDDDDiaryListModuleViewProtocol: class
{
    var presenter: VPDDDDiaryListModulePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
    
    func showView(_ data:[Any])
}

protocol VPDDDDiaryListModuleWireFrameProtocol: class
{
    static func presentVPDDDDiaryListModuleModule(fromView view: AnyObject)
    func presentVPDDDDiaryEditModuleModule()
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
}

protocol VPDDDDiaryListModulePresenterProtocol: class
{
    var view: VPDDDDiaryListModuleViewProtocol? { get set }
    var interactor: VPDDDDiaryListModuleInteractorInputProtocol? { get set }
    var wireFrame: VPDDDDiaryListModuleWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
    
    func fetchUpdateData()
}

protocol VPDDDDiaryListModuleInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    
    func onSuccessData(_ data:[Any])
}

protocol VPDDDDiaryListModuleInteractorInputProtocol: class
{
    var presenter: VPDDDDiaryListModuleInteractorOutputProtocol? { get set }
    var APIDataManager: VPDDDDiaryListModuleAPIDataManagerInputProtocol? { get set }
    var localDatamanager: VPDDDDiaryListModuleLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
    
    func fetchUpdateData()
    
}

protocol VPDDDDiaryListModuleDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol VPDDDDiaryListModuleAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol VPDDDDiaryListModuleLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
}
