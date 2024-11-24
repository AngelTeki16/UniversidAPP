//
//  AppDelegate.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 23/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let splash = SplashViewController()
    let navigationController = UINavigationController(rootViewController: splash)

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    return true
  }


}

