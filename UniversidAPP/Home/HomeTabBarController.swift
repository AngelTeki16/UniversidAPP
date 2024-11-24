//
//  HomeTabBarController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 24/11/24.
//

import UIKit

class HomeTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let inicioVC = InicioViewController()
    inicioVC.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house"), tag: 0)
    
    let perfilVC = PerfilViewController()
    perfilVC.tabBarItem = UITabBarItem(title: "Perfil", image: UIImage(systemName: "person"), tag: 1)
    
    let notificacionesVC = NotificacionesViewController()
    notificacionesVC.tabBarItem = UITabBarItem(title: "Notificaciones", image: UIImage(systemName: "bell"), tag: 2)
    
    viewControllers = [inicioVC, perfilVC, notificacionesVC]
    customizeTabBarAppearance()
    
    
  }
  
  private func customizeTabBarAppearance() {
    tabBar.barTintColor = .lightGray
    tabBar.isTranslucent = true
    tabBar.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
  }
  
}
