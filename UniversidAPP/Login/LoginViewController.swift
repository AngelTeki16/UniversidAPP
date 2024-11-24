//
//  LoginViewController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import UIKit

class LoginViewController: ViewController {
  
  var sesionManager = SesionManager.shared
  
  var imageIcon : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "icon")
    image.contentMode = .scaleAspectFit
    return image
  }()
  
  var LoginLabel : UILabel = {
    var label = UILabel()
    label.text = "Iniciar sesión"
    label.backgroundColor = .clear
    label.textColor = .superDarkBlue
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 30)
    return label
  }()
  
  var userTextField : TextField = {
    var textfield = TextField()
    textfield.backgroundColor = .white
    textfield.keyboardType = .emailAddress
    textfield.placeholder = "Correo electrónico"
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
  
  var loginButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .newBlue
    button.setTitle("Iniciar sesión", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 20
    return button
  }()
  
  var createButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .newBlue
    button.setTitle("No tengo cuenta", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 20
    return button
  }()
  
  var forgotButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .clear
    button.setTitle("Olvidé mi contraseña", for: .normal)
    button.setTitleColor(.newBlue, for: .normal)
    button.titleLabel?.font = .boldSystemFont(ofSize: 15)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.applyGradientBackground(colors: [UIColor.newBlue, UIColor.newPink], locations: [0.0, 1.0] )
    
    initUI()

    navigationController?.navigationBar.isHidden = true
    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
  }
    
  func initUI(){
    let tapEnd = UITapGestureRecognizer(target: self, action: #selector(endEdit))
    view.addGestureRecognizer(tapEnd)
 
    view.addSubview(imageIcon)
    imageIcon.addAnchorsAndCenter(centerX: true, centerY: false, width: width/2, height: width/2, left: nil, top: 50, right: nil, bottom: nil)
    
    view.addSubview(LoginLabel)
    LoginLabel.addAnchors(left: 10, top: 20, right: 20, bottom: nil, withAnchor: . top, relativeToView: imageIcon)
    
    userTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    view.addSubview(userTextField)
    userTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 20, right: 50, bottom: nil, withAnchor: .top, relativeToView: LoginLabel)
    
    view.addSubview(passwordTextField)
    passwordTextField.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 20, right: 50, bottom: nil, withAnchor: .top, relativeToView: userTextField)
    
    loginButton.addTarget(self, action: #selector(validateInfo), for: .touchUpInside)
    view.addSubview(loginButton)
    loginButton.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: 60, right: 50, bottom: nil, withAnchor: .top, relativeToView: passwordTextField)
    
    createButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    view.addSubview(createButton)
    createButton.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: 40, left: 50, top: nil, right: 50, bottom: 50)
    
    forgotButton.addTarget(self, action: #selector(goReset), for: .touchUpInside)
    view.addSubview(forgotButton)
    forgotButton.addAnchorsAndSize(width: nil, height:40, left: nil, top: 10, right: 50, bottom: nil, withAnchor: .top, relativeToView: loginButton)
  }
    
  override func aceptar() {
    deleteAlert()
  }
  
  func clearParameters(){
    userTextField.text = ""
    passwordTextField.text = ""
  }
  
  @objc func validateInfo(){
    let user = userTextField
    let pass = passwordTextField
    
    let validateUser = user.validateField()
    let validatePass = pass.validateField()
    
    if validateUser && validatePass {
      showAlert(type: .loading, title: "Iniciando sesión", message: "")
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [self] in
        deleteAlert()
        guard let user = createUser() else { return }
        sesionManager.setUser(user: user)
        showSuccessAlert()
      }
    }
  }
  
  func createUser() -> User?{
    guard let portadaImage = UIImage(named: "portada"),
          let perfilImage = UIImage(named: "perfil") else { return nil }
    let user = User(name: "Angel Duarte", email: "a@a.com", descripcion: "Máster Universitario en Desarrollo de Software para Dispositivos Móviles", password: "1234", id: 1, role_id: 0, userPhoto: perfilImage, userPortada: portadaImage, age: 27)
    
    return user
  }
  
  func showSuccessAlert(){
    showAlert(type: .success)
  }
  
  @objc func signUp(){
    let registro = RegistroViewController()
    navigationController?.pushViewController(registro, animated: true)
  }
  
  @objc func goReset(){
  
  }
  
  override func animacionTermino(type: TypeAlert) {
    if type == .success {
      print("Go home")
      deleteAlert()
      goHome()
    }
  }
  
  func goHome(){
    let vcHome = HomeTabBarController()
    navigationController?.pushViewController(vcHome, animated: true)
  }

}

extension LoginViewController : UITextFieldDelegate{
  @objc func textFieldDidChange(_ textField: UITextField) {
          if let text = textField.text {
              textField.text = text.lowercased()
          }
      }
}


extension LoginViewController : UIGestureRecognizerDelegate{
   func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
         if gestureRecognizer == navigationController?.interactivePopGestureRecognizer {
             if let swipeGestureRecognizer = gestureRecognizer as? UISwipeGestureRecognizer,
                 swipeGestureRecognizer.direction == .left {
                 return false
             }
         }
         return true
     }
}
