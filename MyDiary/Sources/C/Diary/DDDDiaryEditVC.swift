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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
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
    
    lazy var middleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
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
