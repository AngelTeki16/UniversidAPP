//
//  ProfileInfoView.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 24/11/24.
//

import Foundation
import UIKit


class ProfileInfoView : UIView{
  
  lazy var perfilImage : UIImageView = {
    var imageView = UIImageView()
    imageView.image = UIImage(named: "perfil")
    imageView.layer.cornerRadius = 23
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var perfilNombreLabel : UILabel = {
    var label = UILabel()
    label.textColor = .superDarkBlue
    label.font = .boldSystemFont(ofSize: 15)
    label.text = "--"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var descripcionLabel : UILabel = {
    var label = UILabel()
    label.font = .systemFont(ofSize: 10)
    label.text = "--"
    label.textColor = .newBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var timeLabel : UILabel = {
    var label = UILabel()
    label.font = .systemFont(ofSize: 10)
    label.text = "--"
    label.textColor = .newBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  init(){
    super.init(frame: .zero)
    self.backgroundColor = .clear
    initUI()
  }
  
  func initUI(){
    self.addSubview(perfilImage)
    perfilImage.addAnchorsAndSize(width: 46, height: 46, left: 0, top: 0, right: nil, bottom: nil)
    
    self.addSubview(perfilNombreLabel)
    perfilNombreLabel.addAnchors(left: 0, top: 3, right: nil, bottom: nil , withAnchor: .left, relativeToView: perfilImage)
    
    self.addSubview(descripcionLabel)
    descripcionLabel.addAnchors(left: 10, top: nil, right: 0, bottom: nil, withAnchor: .left, relativeToView: perfilImage)
    descripcionLabel.addAnchors(left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: perfilNombreLabel)
    
    
    self.addSubview(timeLabel)
    timeLabel.addAnchors(left: 10, top: nil, right: 0, bottom: nil, withAnchor: .left, relativeToView: perfilImage)
    timeLabel.addAnchors(left: nil, top: 0, right: nil, bottom: nil, withAnchor: .top, relativeToView: descripcionLabel)
  }
  
  
  func setupData(post : Post){
    perfilImage.image =  post.user.userPhoto
    perfilNombreLabel.text = post.user.name
    descripcionLabel.text = post.user.descripcion
    timeLabel.text = tiempoTranscurrido(fechaString: post.date)
  }
  
  func tiempoTranscurrido(fechaString: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm"
    let fechaPublicacion = formatter.date(from: fechaString)!
    
      let currentDate = Date()
      let diferencia = currentDate.timeIntervalSince(fechaPublicacion)
      
      if diferencia < 86400 {
          let hours = Int(diferencia) / 3600
          return "Hace \(hours) hora\(hours > 1 ? "s" : "")"
      } else {
          let days = Int(diferencia) / 86400
          return "Hace \(days) día\(days > 1 ? "s" : "")"
      }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
