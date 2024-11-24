//
//  UIButton + Extension.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import Foundation
import UIKit

extension UIButton{
  
  
  func disableMode(){
    isEnabled = false
    backgroundColor = .lightGray
    setTitleColor(.white, for: .normal)
  }
  
  func enableMode(){
    isEnabled = true
    backgroundColor = .newBlue
    setTitleColor(.white, for: .normal)
  }
  
}
