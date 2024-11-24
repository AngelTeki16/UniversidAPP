//
//  UIView + Extension.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import Foundation
import UIKit

public extension UIView {
  
  func applyGradientBackground(colors: [UIColor], locations: [NSNumber]? = nil) {
      let gradientLayer = CAGradientLayer()
      gradientLayer.frame = self.bounds
      gradientLayer.colors = colors.map { $0.cgColor }
      gradientLayer.locations = locations
      gradientLayer.startPoint = CGPoint(x: 0, y: 0)
      gradientLayer.endPoint = CGPoint(x: 1, y: 1)
      
      self.layer.insertSublayer(gradientLayer, at: 0)
  }
  
}
