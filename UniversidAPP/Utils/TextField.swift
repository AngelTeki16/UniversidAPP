//
//  TextField.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import Foundation
import UIKit

class TextField : UITextField , UITextFieldDelegate{
  
  let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  
  var button : UIButton = {
    var button = UIButton()
    button.setImage(UIImage(named: "eye"), for: .selected)
    button.setImage(UIImage(named: "eyeClosed"), for: .normal)
    return button
  }()
  
  init(){
    super.init(frame: .zero)
    autocorrectionType = .no
    addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    delegate = self
    placeHolderColor(color: .lightGray)
    textColor = .darkText
    
  }
  
  func addEyeFunction(){
    isSecureTextEntry = true
    button.addTarget(self, action: #selector(changueSecurity), for: .touchUpInside)
    button.backgroundColor = .clear
    self.addSubview(button)
    button.addAnchorsAndSize(width: 40, height: 40, left: nil, top: 5, right: 5, bottom: 5)
    
  }
  
  @objc func changueSecurity(){
    button.isSelected = !button.isSelected
    self.isSecureTextEntry = !button.isSelected
  }
  
  func setInfo(placeHolder : String, keyboardType : UIKeyboardType){
    self.placeholder = placeHolder
    self.keyboardType = keyboardType
  }
  
  func shadowCornerText(){
    layer.cornerRadius = 20
    self.dropShadow()
  }
  
  func validateField() -> Bool{
    if let text = self.text{
      if text.isEmpty{
        placeHolderColor(color: .red)
        self.dropShadowColor(color: .red)
        return false
      }
    }
    return true
  }
  
  func markError(){
    self.text = ""
    placeHolderColor(color: .red)
    self.dropShadowColor(color: .red)
  }
  
  func dismissError(){
    self.text = ""
    placeHolderColor(color: .lightGray)
    self.dropShadowColor(color: .lightGray)
  }
  
  @objc func textFieldDidChange(_ textField: UITextField) {
    placeHolderColor(color: .lightGray)
    self.dropShadow()
  }
  
  func placeHolderColor(color : UIColor){
    self.attributedPlaceholder = NSAttributedString(
      string: self.placeholder ?? "",
      attributes: [NSAttributedString.Key.foregroundColor: color]
    )
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func validarCorreo() -> Bool {
    let correo = self.text ?? ""
    let patron = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    guard let expresionRegular = try? NSRegularExpression(pattern: patron, options: []) else {
      return false
    }
    let coincidencias = expresionRegular.matches(in: correo, options: [], range: NSRange(location: 0, length: correo.utf16.count))
    return coincidencias.count == 1 && coincidencias[0].range.length == correo.utf16.count
  }
  
  func validateNumber() -> Bool {
    let phoneNumber = self.text ?? ""
    let phoneRegex = #"^\d{10}$"#
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
    return phoneTest.evaluate(with: phoneNumber)
  }
  
  func validAge() -> Bool {
    if let text = self.text{
      if !text.isEmpty{
        let age = Int(self.text ?? "0") ?? 0
        let minValidAge = 3
        let maxValidAge = 99
        return age >= minValidAge && age <= maxValidAge
      }
    }
    return false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
