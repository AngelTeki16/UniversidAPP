//
//  SplashViewController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import UIKit

class SplashViewController: UIViewController {
  
  let splashTime : Double = 3.0
  
  var imageIcon : UIImageView = {
    var image = UIImageView()
    image.image = UIImage(named: "icon")
    image.contentMode = .scaleAspectFit
    return image
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.applyGradientBackground(colors: [UIColor.newBlue, UIColor.newPink], locations: [0.0, 1.0] )
    
    initUI()
    setUpTimer()
  }
  
  func initUI(){
    view.addSubview(imageIcon)
    imageIcon.addAnchorsAndCenter(centerX: true, centerY: true, width: width / 2, height: width / 2, left: nil, top: nil, right: nil, bottom: nil)
  }
  
  func setUpTimer(){
    Timer.scheduledTimer(timeInterval: splashTime, target: self, selector: #selector(goToLogin), userInfo: nil, repeats: false)
  }
  
  @objc func goToLogin(){
    let loginViewController = LoginViewController()
    navigationController?.pushViewController(loginViewController, animated: true)
    
  }
  
}
