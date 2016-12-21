//
//  MainViewController.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/16.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit
import IGListKit

class MainViewController: UIViewController, IGListAdapterDataSource {

    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self,workingRangeSize: 0)
    }()
    
    let collectionView = IGListCollectionView(frame:CGRect.zero, collectionViewLayout:UICollectionViewFlowLayout())
    
    let demos = [
        DDDDiaryListMonthItem(month: .Oct),
        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil),
        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil),
        DDDDiaryListMonthItem(month: .Jan),
        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil),
        DDDDiaryListDiaryItem(date: "5", time: "11:10", title: "东京生活3", desc: "There are", status: "水", weatherType: .Sunny, moodType: .Happy, accessoryType: .Defined, locationType: .Defined, controllerClass: nil)
    ] as [Any]
    
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
        case is DDDDiaryListMonthItem:   return DDDDiaryListMonthSC()
        case is DDDDiaryListDiaryItem: return DDDDiaryListDiarySC()
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
