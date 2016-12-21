//
//  DDDRichTextView.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/18.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import UIKit

public let DDDRichTextViewDetectedDataHandlerAttributeName = "RichTextViewDetectedDataHandlerAttributeName"
public let DDDRichTextViewImageAttributeName = "RichTextViewImageAttributeName"
public let DDDRichTextViewCustomDataAttributeName = "RichTextViewCustomDataAttributeName"

class DDDRichTextView: UITextView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    
    var richTextStorage = NSTextStorage()
    
    var richLayoutManager = NSLayoutManager()
    
    var richTextContainer = NSTextContainer()
    
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    init(frame: CGRect) {
        richTextStorage.addLayoutManager(richLayoutManager)
        richLayoutManager.addTextContainer(richTextContainer)
        
        super.init(frame: frame, textContainer: richTextContainer)
        
        initialize()
    }
    
    func initialize() {
    }
    

    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

}
