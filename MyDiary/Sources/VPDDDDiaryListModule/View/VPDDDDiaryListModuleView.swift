//
// Created by VIPER
// Copyright (c) 2017 VIPER. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class VPDDDDiaryListModuleView: UIViewController, VPDDDDiaryListModuleViewProtocol, IGListAdapterDataSource
{
    var presenter: VPDDDDiaryListModulePresenterProtocol?
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self,workingRangeSize: 0)
    }()
    
    let collectionView = IGListCollectionView(frame:CGRect.zero, collectionViewLayout:UICollectionViewFlowLayout())
    
//    let demos = [
//        DDDDiaryListMonthItem(month: .Oct),
//        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil),
//        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil),
//        DDDDiaryListMonthItem(month: .Jan),
//        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil),
//        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil)
//        ] as [Any]
    var demos:[Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "main"
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.blue
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(p_editDiary), for: UIControlEvents.touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        
        // Do any additional setup after loading the view.
        presenter?.fetchUpdateData()
    }
    
    
    func showView(_ data:[Any]) {
        demos = data
        adapter.reloadData { (Bool) in
            
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func p_editDiary() {
        let vc = DDDDiaryEditVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        switch object {
        case is DiaryListMonthViewModel:   return DDDDiaryListMonthSC()
        case is DiaryListDayViewModel: return DDDDiaryListDiarySC()
        default: return DDDDiaryListDiarySC()
        }
    }
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        let arr = demos.map { $0 as! IGListDiffable}
        return arr
        //        return demos.map { $0 as! IGListDiffable}
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
    

}
