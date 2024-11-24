//
//  SesionManager.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 24/11/24.
//

import Foundation

class SesionManager : NSObject {
  
  static let shared = SesionManager()
  
  private var user : User?
  
  
  func setUser(user : User){
    self.user = user
  }
  
  func getUser() -> User?{
    guard let user = self.user else { return nil }
    return user
  }
  
}
