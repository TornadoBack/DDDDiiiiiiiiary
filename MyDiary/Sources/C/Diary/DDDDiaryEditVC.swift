//
//  DDDDiaryEditVC.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/18.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit

class DDDDiaryEditVC: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        btn.titleLabel?.text = "图"
        btn.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(p_addImage), for: UIControlEvents.touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        
        self.view.addSubview(topView)
        self.view.addSubview(middleView)
        self.view.addSubview(diaryEditView)
        self.view.addSubview(diaryToolBar)
        
        self.topView.addSubview(noteBookImage)
        self.topView.addSubview(noteBookLable)
        
        self.middleView.addSubview(diaryMonthLable)
        self.middleView.addSubview(diaryWeekLable)
        self.middleView.addSubview(diaryDayLable)
        self.middleView.addSubview(diaryTitleLable)
        self.middleView.addSubview(diaryTimeLable)
        self.middleView.addSubview(diaryMoodBtn)
        self.middleView.addSubview(diaryWeatherBtn)
        self.middleView.addSubview(diaryLocationBtn)
        
        p_layoutSubViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func p_layoutSubViews(){
        
        topView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view).offset(64)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(40)
        }
        
        middleView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(topView.snp.bottom)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(120)
        }
        
        diaryToolBar.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(40)
        }
        
        diaryEditView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(middleView.snp.bottom)
            make.bottom.equalTo(diaryToolBar.snp.top)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
        }
        
    }
    
    //MARK- Target
    
    func p_addImage(){
        let pickVc = UIImagePickerController()
        pickVc.sourceType = .photoLibrary
        pickVc.delegate = self
        present(pickVc, animated: true, completion: nil)
    }
    
    //MARK- UIImagepickerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        diaryEditView.becomeFirstResponder()
        let img = info[UIImagePickerControllerOriginalImage]
        
        p_setAttrImage(img: img as! UIImage)

    }
    
    func p_setAttrImage( img:UIImage){
//        // 1. 保存图片与图片的location
//        [self.photos addObject:image];
//        [self.locations addObject:@(self.textView.selectedRange.location)];
        
        // 2. 将图片插入到富文本中
        
        let attach = NSTextAttachment()
        attach.image = img
        let imageRate = img.size.width / img.size.height
        attach.bounds = CGRect(x: 0, y: 10, width: diaryEditView.frame.size.width, height: diaryEditView.frame.size.width * imageRate)
        
        let imageAttr = NSAttributedString(attachment: attach)
        
        let mutableAttr = diaryEditView.attributedText.mutableCopy() as? NSMutableAttributedString
        mutableAttr?.insert(imageAttr, at: diaryEditView.selectedRange.location)
        diaryEditView.attributedText = mutableAttr
        
    }
    
    //MARK- UITextdelegate
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(textView.attributedText)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.attributedText)
    }
    
    //MArK- getter and setter
    
    lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var noteBookImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    lazy var noteBookLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()
    
    lazy var middleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var diaryDayLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()
    
    lazy var diaryWeekLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()
    
    lazy var diaryMonthLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()

    lazy var diaryTitleLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()
    
    lazy var diaryTimeLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 1
        return lable
    }()
    
    lazy var diaryWeatherBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    lazy var diaryMoodBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    lazy var diaryLocationBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    lazy var diaryEditView: DDDRichTextView = {
        let textView = DDDRichTextView()
        textView.delegate = self
        textView.allowsEditingTextAttributes = true
        textView.contentInset = UIEdgeInsetsMake(4, 4, 4, -4)
        textView.becomeFirstResponder()
        return textView
    }()
    
    lazy var diaryToolBar: UIView = {
        let bar = UIView()
        return bar
    }()

}
