//
//  HtmlStringToATTR.swift
//  MyDiary
//
//  Created by duyongxiang on 16/12/20.
//  Copyright © 2016年 Ddd. All rights reserved.
//

import Foundation


class HtmlStringToATTR: NSObject {
    
//    open func appendImage(_ imageName: String ,image: UIImage, width: CGFloat) {
//        
//        if let newAttributedText = self.attributedText.mutableCopy() as? NSMutableAttributedString {
//            
//            newAttributedText.append(NSAttributedString(string: "\n"))
//            
//            var _ = text.lengthOfBytes(using: String.Encoding.utf8)
//            
//            self.attributedText = newAttributedText
//            
//            let imageWidth = image.size.width
//            
//            let radio:CGFloat = width / imageWidth
//            
//            appendImage(imageName, image: image, size: CGSize(width: image.size.width*radio, height: image.size.height*radio))
//            
//            appendNewLine()
//        }
//    }
//    
//    open func appendNewLine() {
//        
//        if let newAttributedText = self.attributedText.mutableCopy() as? NSMutableAttributedString {
//            
//            let newLineString = NSMutableAttributedString(string: "\n")
//            
//            newLineString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle(0), range: NSRange(location: 0, length: newLineString.length))
//            
//            newAttributedText.append(newLineString)
//            
//            attributedText = newAttributedText
//        }
//        
//    }
//    
//    open func appendImage(_ imageName: String ,image: UIImage, size: CGSize){
//        
//        let attachment = NSTextAttachment(data: nil, ofType: nil)
//        attachment.image = image
//        attachment.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        
//        if let attachmentAttributedString = NSAttributedString(attachment: attachment) as? NSMutableAttributedString {
//            // sets the paragraph styling of the text attachment
//            
//            
//            let attr: [String: Any] = [NSParagraphStyleAttributeName: paragraphStyle(0), DDDRichTextViewImageAttributeName: imageName]
//            
//            attachmentAttributedString.addAttributes(attr, range: NSRange(location: 0, length: attachmentAttributedString.length))
//            
//            if let newAttributedText = self.attributedText.mutableCopy() as? NSMutableAttributedString {
//                
//                newAttributedText.append(attachmentAttributedString)
//                
//                self.attributedText = newAttributedText
//            }
//        }
//    }
//    
//    open func findAllImageRange() -> [[String : NSRange]]?{
//        
//        var finalRange = [[String : NSRange]]()
//        
//        self.attributedText.enumerateAttribute(DDDRichTextViewImageAttributeName, in: NSRange(location: 0, length: self.attributedText.length), options: [], using: { (value, range, finish) in
//            
//            if let value = value as? String {
//                finalRange.append([value :  range])
//            }
//            
//        })
//        
//        if finalRange.count > 0 {
//            return finalRange
//        } else {
//            return nil
//        }
//        
//    }
//    
//    open func findImageRange(_ imageHash: String) -> NSRange?{
//        
//        var finalRange: NSRange?
//        
//        self.attributedText.enumerateAttribute(DDDRichTextViewImageAttributeName, in: NSRange(location: 0, length: self.attributedText.length), options: [], using: { (value, range, finish) in
//            
//            if let value = value as? String {
//                if value == imageHash {
//                    finalRange = range
//                }
//            }
//            
//        })
//        
//        if let finalRange = finalRange {
//            return finalRange
//        }
//        
//        return nil
//        
//    }
//    
//    fileprivate func paragraphStyle(_ spacing: CGFloat) -> NSMutableParagraphStyle {
//        
//        let paragraphStyle = NSMutableParagraphStyle()
//        
//        paragraphStyle.paragraphSpacing = spacing
//        
//        paragraphStyle.paragraphSpacingBefore = spacing
//        
//        return paragraphStyle
//    }
//    
//    open func insertImage(_ imageName: String, image: UIImage, size: CGSize, index: Int){
//        
//        let attachment = NSTextAttachment(data: nil, ofType: nil)
//        attachment.image = image
//        attachment.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        
//        if let attachmentAttributedString = NSAttributedString(attachment: attachment) as? NSMutableAttributedString {
//            // sets the paragraph styling of the text attachment
//            
//            let paragraphStyle = NSMutableParagraphStyle()
//            
//            paragraphStyle.paragraphSpacing = 10
//            
//            paragraphStyle.paragraphSpacingBefore = 10
//            
//            let attr: [String: Any] = [NSParagraphStyleAttributeName: paragraphStyle, DDDRichTextViewImageAttributeName: imageName]
//            
//            attachmentAttributedString.addAttributes(attr, range: NSRange(location: 0, length: attachmentAttributedString.length))
//            
//            if let newAttributedText = self.attributedText.mutableCopy() as? NSMutableAttributedString {
//                
//                newAttributedText.insert(attachmentAttributedString, at: index)
//                
//                self.attributedText = newAttributedText
//            }
//        }
//    }
//    
//    open func replaceImage(_ imageName: String, image: UIImage, size: CGSize, index: Int){
//        
//        let attachment = NSTextAttachment(data: nil, ofType: nil)
//        attachment.image = image
//        attachment.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        
//        if let attachmentAttributedString = NSAttributedString(attachment: attachment) as? NSMutableAttributedString {
//            // sets the paragraph styling of the text attachment
//            
//            let paragraphStyle = NSMutableParagraphStyle()
//            
//            paragraphStyle.paragraphSpacing = 10
//            
//            paragraphStyle.paragraphSpacingBefore = 10
//            
//            let attr: [String: Any] = [NSParagraphStyleAttributeName: paragraphStyle, DDDRichTextViewImageAttributeName: imageName as Any]
//            
//            attachmentAttributedString.addAttributes(attr, range: NSRange(location: 0, length: attachmentAttributedString.length))
//            
//            if let newAttributedText = self.attributedText.mutableCopy() as? NSMutableAttributedString {
//                
//                newAttributedText.replaceCharacters(in: NSRange(location: index, length: 1), with: attachmentAttributedString)
//                
//                self.attributedText = newAttributedText
//            }
//        }
//    }
}
