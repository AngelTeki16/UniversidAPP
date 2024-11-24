//
//  AlertView.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import Foundation
import UIKit
import Lottie

enum TypeAlert{
  case error
  case success
  case loading
  case delete
  case no
}

protocol CustomAlertDelegate{
  func aceptar()
  func cancelarAlert()
  func animacionTermino(type : TypeAlert)
}

class CustomAlert : UIView{
  
  var type : TypeAlert?
  var delegate : CustomAlertDelegate?
  
  var backgroundView : UIView = {
    var view = UIView()
    view.backgroundColor = .gray
    view.alpha = 0.5
    return view
  }()
  
  var alertView : UIView = {
    var view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 20
    return view
  }()
  
  var iconImage : UIImageView = {
    var image = UIImageView()
    image.contentMode = .scaleAspectFit
    return image
  }()
  
  var messageLabel : UILabel = {
    var label = UILabel()
    label.text = ""
    label.numberOfLines = 2
    label.textColor = .darkGray
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 20)
    return label
  }()
  
  var subMessage : UILabel = {
    var label = UILabel()
    label.text = ""
    label.textColor = .darkGray
    label.textAlignment = .center
    label.numberOfLines = 2
    label.font = .systemFont(ofSize: 15)
    return label
  }()
  
  
  var aceptarButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .newBlue
    button.setTitleColor(.white, for: .normal)
    button.setTitle("ACEPTAR", for: .normal)
    button.layer.cornerRadius = 20
    return button
  }()
  
  var cncelarButton : UIButton = {
    var button = UIButton()
    button.backgroundColor = .red
    button.setTitleColor(.white, for: .normal)
    button.setTitle("CANCELAR", for: .normal)
    button.layer.cornerRadius = 20
    return button
  }()
  

  init(){
    super.init(frame: .zero)
    self.backgroundColor = .clear
  }
  
  func initUI(type : TypeAlert){
    self.type = type
    self.addSubview(backgroundView)
    backgroundView.addAnchorsWithMargin(0)
    
    switch type{
    case .error:
      addSubview(alertView)
      alertView.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: height/3.3, left: 30, top: nil, right: 30, bottom: nil)
      
      alertView.addSubview(iconImage)
      iconImage.addAnchorsAndCenter(centerX: true, centerY: false, width: width/4, height: width/4, left: nil, top: 10, right: nil, bottom: nil)
      
      alertView.addSubview(messageLabel)
      messageLabel.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: iconImage)
      
      alertView.addSubview(subMessage)
      subMessage.addAnchors(left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: messageLabel)

      aceptarButton.addTarget(self, action: #selector(aceptarAction), for: .touchUpInside)
      alertView.addSubview(aceptarButton)
      aceptarButton.addAnchorsAndSize(width: nil, height: 40, left: 30, top: nil, right: 30, bottom: 20)

    case .loading:
      self.addSubview(alertView)
      alertView.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: height/4, left: 30, top: nil, right: 30, bottom: nil)
      
      alertView.addSubview(iconImage)
      iconImage.addAnchorsAndCenter(centerX: true, centerY: false, width: width/4, height: width/4, left: nil, top: 10, right: nil, bottom: nil)
      
      alertView.addSubview(messageLabel)
      messageLabel.addAnchors(left: 10, top: 10, right: 10, bottom: 10, withAnchor: .top, relativeToView: iconImage)
      
    case .no:
      break
    case .delete:
      addSubview(alertView)
      alertView.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: height/3.5, left: 30, top: nil, right: 30, bottom: nil)
      
      alertView.addSubview(iconImage)
      iconImage.addAnchorsAndCenter(centerX: true, centerY: false, width: width/4, height: width/4, left: nil, top: 10, right: nil, bottom: nil)
      
      alertView.addSubview(messageLabel)
      messageLabel.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: iconImage)
      
      aceptarButton.addTarget(self, action: #selector(aceptarAction), for: .touchUpInside)
      alertView.addSubview(aceptarButton)
      aceptarButton.addAnchorsAndSize(width: nil, height: 40, left: 30, top: 10, right: 30, bottom: nil, withAnchor: .top, relativeToView: messageLabel)
      
      cncelarButton.addTarget(self, action: #selector(cancelarAction), for: .touchUpInside)
      alertView.addSubview(cncelarButton)
      cncelarButton.addAnchorsAndSize(width: nil, height: 40, left: 30, top: 10, right: 30, bottom: nil, withAnchor: .top, relativeToView: aceptarButton)
    case .success:
      self.addSubview(alertView)
      alertView.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: height/4, left: 30, top: nil, right: 30, bottom: nil)
      
      alertView.addSubview(iconImage)
      iconImage.addAnchorsAndCenter(centerX: true, centerY: true, width: width/4, height: width/4, left: nil, top: nil, right: nil, bottom: nil)
    }
  }
  
  func setError(title: String, subTitle : String){
    messageLabel.text = title
    subMessage.text = subTitle
    switch type{
    case .error:
      iconImage.image = UIImage(named: "error")
    case .success:
      iconImage.image = UIImage(named: "")
      iconImage.image = iconImage.image?.withRenderingMode(.alwaysTemplate)
      showLottie(name: "success")
    case .loading:
      iconImage.image = UIImage(named: "")
      iconImage.image = iconImage.image?.withRenderingMode(.alwaysTemplate)
      showLottie(name: "loader")
    case .delete:
      iconImage.image = UIImage(named: "delete")
    case .no:
      break
    case .none:
      break
    
    }
  }
  
  @objc func aceptarAction(){
    delegate?.aceptar()
  }
  
  @objc func cancelarAction(){
    delegate?.cancelarAlert()
  }
  
  
  func showLottie(name : String){
    let animationView = LottieAnimationView(name: name)
    animationView.contentMode = .scaleAspectFit
    
    if name == "success" {
      animationView.loopMode = .playOnce
    } else {
      animationView.loopMode = .loop
    }
    animationView.play { finished in
      if finished {
        self.animacionFinalizada()
      }
    }
    
    iconImage.addSubview(animationView)
    animationView.addAnchorsWithMargin(0)
  }
  
  func animacionFinalizada(){
    delegate?.animacionTermino(type: .success)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


