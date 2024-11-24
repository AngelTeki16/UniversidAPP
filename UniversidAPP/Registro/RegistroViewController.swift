//
//  RegistroViewController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import UIKit

class RegistroViewController: ViewController {
  
  var activeTextField: UITextField?
  
  var superContent : UIView = {
    var view = UIView()
    view.backgroundColor = .clear
    return view
  }()
  
  var imageIcon : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "icon")
    image.contentMode = .scaleAspectFit
    return image
  }()
  
  var firsSectionView : UIView = {
    var view = UIView()
    view.backgroundColor = .clear
    return view
  }()
  
  var nameTextField : TextField = {
    var textfield = TextField()
    textfield.shadowCornerText()
    textfield.setInfo(placeHolder: "Nombre completo", keyboardType: .asciiCapable)
    textfield.backgroundColor = .white
    textfield.placeHolderColor(color: .lightGray)
    return textfield
  }()
  
  var emailTextField : TextField = {
    var textfield = TextField()
    textfield.backgroundColor = .white
    textfield.keyboardType = .emailAddress
    textfield.setInfo(placeHolder: "Correo electrónico", keyboardType: .emailAddress)
    textfield.layer.cornerRadius = 20
    textfield.placeHolderColor(color: .lightGray)
    textfield.dropShadow()
    return textfield
  }()
  
  var passwordTextField : TextField = {
    var textfield = TextField()
    textfield.backgroundColor = .white
    textfield.keyboardType = .emailAddress
    textfield.placeholder = "Contraseña"
    textfield.layer.cornerRadius = 20
    textfield.addEyeFunction()
    textfield.placeHolderColor(color: .lightGray)
    textfield.dropShadow()
    return textfield
  }()
  
  var confirmPasswordTextField : TextField = {
    var textfield = TextField()
    textfield.backgroundColor = .white
    textfield.keyboardType = .emailAddress
    textfield.placeholder = "Confirmar contraseña"
    textfield.addEyeFunction()
    textfield.layer.cornerRadius = 20
    textfield.placeHolderColor(color: .lightGray)
    textfield.dropShadow()
    return textfield
  }()
  
  var nextButton : UIButton = {
    var button = UIButton()
    button.setTitle("Continuar", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 20
    return button
  }()
  
  var terminos : UILabel = {
    var label = UILabel()
    label.text = "Acepto los terminos y condiciones"
    label.font = .boldSystemFont(ofSize: 12)
    label.textColor = .white
    return label
  }()
  
  var checkButton : UIButton = {
    var button = UIButton(type: .custom)
    button.backgroundColor = .white
    button.layer.borderColor = UIColor.gray.cgColor
    button.layer.borderWidth = 1
    button.setImage(UIImage(named: "w"), for: .normal)
    button.setImage(UIImage(named: "check"), for: .selected)
    button.imageView?.contentMode = .scaleAspectFit
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .lightBlue
    initSuperConten()
    initUI()
  }
  
  
  func initSuperConten(){
    view.addSubview(superContent)
    superContent.addAnchors(left: 0, top: 0, right: 0, bottom: 0)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(backAction))
    setBackButtonColor(color: .darkBlue)
    backButton.addGestureRecognizer(tap)
    superContent.addSubview(backButton)
    backButton.addAnchorsAndSize(width: 25, height: 25, left: 10, top: 50, right: nil, bottom: nil)
    
  }
  
  func initUI(){
    let tapEnd = UITapGestureRecognizer(target: self, action: #selector(endEdit))
    superContent.addGestureRecognizer(tapEnd)
    
    superContent.addSubview(imageIcon)
    imageIcon.addAnchorsAndCenter(centerX: true, centerY: false, width: width/2, height: width/2, left: nil, top: 50, right: nil, bottom: nil)
    
    superContent.addSubview(firsSectionView)
    firsSectionView.addAnchors(left: 0, top: 0, right: 0, bottom: 0, withAnchor: .top, relativeToView: imageIcon)
    
    initFirstSection()
  }
  
  @objc func initFirstSection(){
    let tapEnd = UITapGestureRecognizer(target: self, action: #selector(endEdit))
    firsSectionView.addGestureRecognizer(tapEnd)
    
    nameTextField.delegate = self
    firsSectionView.addSubview(nameTextField)
    nameTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 50, right: 50, bottom: nil)
    
    emailTextField.delegate = self
    emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    firsSectionView.addSubview(emailTextField)
    emailTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 20, right: 50, bottom: nil, withAnchor: .top, relativeToView: nameTextField)
    
    passwordTextField.delegate = self
    firsSectionView.addSubview(passwordTextField)
    passwordTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 20, right: 50, bottom: nil, withAnchor: .top, relativeToView: emailTextField)
    
    confirmPasswordTextField.delegate = self
    firsSectionView.addSubview(confirmPasswordTextField)
    confirmPasswordTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 20, right: 50, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
    
    checkButton.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
    
    firsSectionView.addSubview(checkButton)
    checkButton.addAnchorsAndSize(width: 15, height: 15, left: 50, top: 20, right: nil, bottom: nil,withAnchor: .top, relativeToView: confirmPasswordTextField)
    
    firsSectionView.addSubview(terminos)
    terminos.addAnchorsAndSize(width: nil, height: 15, left: 10, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: checkButton)
    terminos.addAnchors(left: nil, top: 20, right: nil, bottom: nil, withAnchor: .top, relativeToView: confirmPasswordTextField)
    
    nextButton.enableMode()
    nextButton.addTarget(self, action: #selector(showSecondSection), for: .touchUpInside)
    firsSectionView.addSubview(nextButton)
    
    nextButton.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 50, right: 50, bottom: nil, withAnchor: .top, relativeToView: checkButton)
  }
  
  @objc func checkBoxButtonTapped() {
    checkButton.isSelected = !checkButton.isSelected
  }
  
  @objc func showSecondSection(){
    let validateName = nameTextField.validateField()
    let validateEmail = emailTextField.validateField()
    let validatePass = passwordTextField.validateField()
    let validateCPass = confirmPasswordTextField.validateField()
    
    if emailTextField.validarCorreo(){
      if validateName && validateEmail && validatePass && validateCPass{
        validePasswords()
      }
    }else{
      emailTextField.markError()
    }
  }
  
  func validePasswords(){
    let pass = passwordTextField.text ?? ""
    let cPass = confirmPasswordTextField.text ?? ""
    if pass == cPass && pass.count >= 6{
      if checkButton.isSelected{
       // signupNetworking()
      }else{
       // initSecondSection()
      }
    }else{
      passwordTextField.markError()
      confirmPasswordTextField.markError()
      showAlert(type: .error, title: "Error en contraseña", message: "Las contraseñas deben ser iguales y contener al menos 6 caracteres")
    }
  }
  
  override func aceptar() {
    deleteAlert()
  }
  
  func startNotificationCenter(){
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
      return
    }
    
    if let activeTextField = activeTextField {
      let frame = activeTextField.convert(activeTextField.frame, to: view)
      let offsetY = frame.origin.y + frame.size.height - keyboardSize.origin.y + 10
      if offsetY > 0 {
        superContent.frame.origin.y -= offsetY
      }
    }
  }
  
  @objc func keyboardWillHide() {
    superContent.frame.origin.y = 0
  }
  
}


extension RegistroViewController : UITextFieldDelegate{
  @objc func textFieldDidChange(_ textField: UITextField) {
    if let text = textField.text {
      textField.text = text.lowercased()
    }
  }
}
