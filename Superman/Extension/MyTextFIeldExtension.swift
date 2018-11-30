//
//  MyTextFIeldExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 19/9/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit
import Material

extension UITextView: UITextViewDelegate{
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.count > 0
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            
            placeholderLabel.snp.makeConstraints
                { (make) in
                    make.top.equalToSuperview().offset(7)
                    make.width.equalToSuperview().offset(-8)
                    make.centerX.equalToSuperview()
                    make.bottom.lessThanOrEqualToSuperview().offset(-7)
            }
            
            
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        
        let placeholderLabel: UILabel = {
            let label = UILabel()
            label.text = placeholderText
            label.sizeToFit()
            label.font = RobotoFont.regular(with: 14)
            label.textColor = UIColor.lightGray
            label.tag = 100
            label.isHidden = self.text.count > 0
            label.numberOfLines = 0
            label.frame.size.width = 300
            return label
        }()
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
}

extension UITextField
{
    enum Direction
    {
        case Left
        case Right
    }
    
    func AddImage(direction:Direction,image:UIImage,Frame:CGRect,backgroundColor:UIColor)
    {
        let View = UIView(frame: Frame)
        View.backgroundColor = backgroundColor
        
        let imageView = UIImageView(frame: Frame)
        imageView.image = image
        
        View.addSubview(imageView)
        
        if Direction.Left == direction
        {
            self.leftViewMode = .always
            self.leftView = View
        }
        else
        {
            self.rightViewMode = .always
            self.rightView = View
        }
    }
    
    func AddCheckedImage()
    {
        let Frame = CGRect(x: -5, y: 0, width: 20, height: 20)
        let backgroundColor = UIColor.clear
        let Image = #imageLiteral(resourceName: "checked")
        
        let View = UIView(frame: Frame)
        View.backgroundColor = backgroundColor
        
        let imageView = UIImageView(frame: Frame)
        imageView.image = Image
        imageView.contentMode = .scaleAspectFit
        
        View.addSubview(imageView)
        self.rightViewMode = .always
        self.rightView = View
        
        UIView.animate(withDuration: 0.5, animations: {
            self.rightView?.alpha = 1
        })
        
    }
    
    func RemoveRightImage()
    {
        UIView.animate(withDuration: 0.5, animations: {
            self.rightView?.alpha = 0
        }){ _ in
            self.rightViewMode = .never
            self.rightView = nil
        }
        
    }
    
    func RemoveLeftImage()
    {
        UIView.animate(withDuration: 0.5, animations: {
            self.leftView?.alpha = 0
        }){ _ in
            self.leftViewMode = .never
            self.leftView = nil
        }
        
    }
    
    func RemoveImage()
    {
        UIView.animate(withDuration: 0.5, animations: {
            self.leftView?.alpha = 0
            self.rightView?.alpha = 0
        }){ _ in
            self.rightViewMode = .never
            self.rightView = nil
            self.leftViewMode = .never
            self.leftView = nil
        }
        
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
}

extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard(_ title: String = "close".localized.lowercased())
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: title, style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}
extension TextView {
    
    func forDefault() {
        self.font = UIFont.fontForMessageRegular()
        self.textColor = UIColor.kerryGray
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.textViewBorder.cgColor
        self.clipsToBounds = true
        self.placeholderLabel.textColor = UIColor.placeholder
        self.placeholderLabel.font = RobotoFont.regular(with: 17)
        self.textContainerInsets = UIEdgeInsets(top: 5, left: 3, bottom: 5, right: 3)
    }
    
    func forDefaultNoBorder() {
        self.font = UIFont.fontForMessageRegular()
        self.textColor = UIColor.kerryGray
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.placeholderLabel.textColor = UIColor.placeholder
        self.placeholderLabel.font = RobotoFont.regular(with: 17)
        self.textContainerInsets = UIEdgeInsets(top: 5, left: 3, bottom: 5, right: 25)
    }
    
    func forDetail() {
        self.font = UIFont.fontForDateTimeRegular()
        self.textColor = UIColor.kerryGray
        self.placeholderLabel.textColor = UIColor.placeholder
        self.placeholderLabel.font = RobotoFont.regular(with: 14)
        self.textContainerInsets = UIEdgeInsets(top: 5, left: 3, bottom: 5, right: 3)
    }
    
}
extension UITextField {
    
    func forMobilePassword(_ isPassword: Bool = false) {
        self.addDoneButtonOnKeyboard()
        self.textColor = UIColor.kerryGray
        self.isSecureTextEntry = isPassword
        self.textAlignment = .natural
        self.font = RobotoFont.regular(with: 16)
        self.tintColor = .black
        self.borderStyle = .roundedRect
        self.borderColor = UIColor.kerryGray
        self.backgroundColor = .clear
        self.layoutEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.returnKeyType = .done
        self.keyboardType = .numberPad
    }
    
    func forDefault() {
        self.addDoneButtonOnKeyboard()
        self.textColor = UIColor.kerryGray
        self.textAlignment = .natural
        self.font = RobotoFont.regular(with: 16)
        self.tintColor = .black
        self.borderStyle = .roundedRect
        self.borderColor = UIColor.kerryGray
        self.backgroundColor = .clear
        self.layoutEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.returnKeyType = .done
        self.keyboardType = .default
    }
    
    func forEmail() {
        self.addDoneButtonOnKeyboard()
        self.textColor = UIColor.kerryGray
        self.textAlignment = .natural
        self.font = RobotoFont.regular(with: 16)
        self.tintColor = .black
        self.borderStyle = .roundedRect
        self.borderColor = UIColor.kerryGray
        self.backgroundColor = .clear
        self.layoutEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.returnKeyType = .done
        self.keyboardType = .emailAddress
    }
}

extension TextField {
    
    func forMobilePasswordCenterInput(_ isPassword: Bool = false) {
        self.addDoneButtonOnKeyboard()
        self.textColor = UIColor.kerryGray
        self.isSecureTextEntry = isPassword
        self.textAlignment = .center
        self.font = RobotoFont.regular(with: 22)
        self.tintColor = .black
        self.borderStyle = .none
        self.backgroundColor = .clear
        self.layoutEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.returnKeyType = .done
        self.keyboardType = .numberPad
        self.dividerContentEdgeInsets.bottom = -10
        self.dividerNormalColor = Color.flatWhite
        self.dividerActiveColor = UIColor.kerryGray
        self.dividerNormalHeight = 1
        self.dividerActiveHeight = 2
    }
    
    func forEmailCenterInput() {
        self.addDoneButtonOnKeyboard()
        self.textColor = UIColor.kerryGray
        self.isSecureTextEntry = false
        self.textAlignment = .center
        self.font = RobotoFont.regular(with: 22)
        self.tintColor = .black
        self.borderStyle = .none
        self.backgroundColor = .clear
        self.layoutEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.returnKeyType = .done
        self.keyboardType = .emailAddress
        self.dividerContentEdgeInsets.bottom = -10
        self.dividerNormalColor = Color.flatWhite
        self.dividerActiveColor = UIColor.kerryGray
        self.dividerNormalHeight = 1
        self.dividerActiveHeight = 2
    }
    
}

// MARK: - For email address

let __firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
let __serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
let __emailRegex = __firstpart + "@" + __serverpart + "[A-Za-z]{2,8}"
let __emailPredicate = NSPredicate(format: "SELF MATCHES %@", __emailRegex)

extension String {
    func isEmail() -> Bool {
        return __emailPredicate.evaluate(with: self)
    }
}

extension UITextField {
    
    func isEmail() -> Bool {
        return ((self.text?.isEmail) != nil)
        
    }
    
}
