//
//  ViewController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import Foundation
import UIKit

class ViewController : UIViewController,CustomAlertDelegate{
  
  var alert : CustomAlert?
    
  var backButton : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "back")
    image.tintColor = .blue
    image.contentMode = .scaleAspectFit
    image.isUserInteractionEnabled = true
    return image
  }()
  
  func showAlert(type: TypeAlert, title: String = "", message: String = ""){
    alert = CustomAlert()
    alert?.delegate = self
    alert?.initUI(type: type)
    view.addSubview(alert!)
    alert?.setError(title: title, subTitle: message)
    alert?.addAnchorsWithMargin(0)
  }
  
  func deleteAlert(){
    alert?.removeFromSuperview()
  }
    
  func setupNavigation() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .white
    appearance.configureWithOpaqueBackground()
    appearance.setBackIndicatorImage(UIImage(), transitionMaskImage: UIImage())
    self.navigationController?.navigationBar.standardAppearance = appearance
    self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
  
  }
    
  func setBackButton(){
    let tap = UITapGestureRecognizer(target: self, action: #selector(backAction))
    backButton.addGestureRecognizer(tap)
    view.addSubview(backButton)
    backButton.addAnchorsAndSize(width: 25, height: 25, left: 10, top: 50, right: nil, bottom: nil)
  }
  
  func setBackButtonColor(color : UIColor){
    backButton.tintColor = color
  }
  
  @objc func endEdit() {
    view.endEditing(true)
  }
  
  @objc func backAction(){
    navigationController?.popViewController(animated: true)
  }
  
  func cancelarAlert() {
    
  }
  
  func aceptar() {
    
  }
  
  func animacionTermino(type: TypeAlert) {
    
  }
}


