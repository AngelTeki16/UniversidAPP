//
//  PerfilViewController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 24/11/24.
//

import UIKit

class PerfilViewController: ViewController {
  
  var user : User?
  
  lazy var portadaImage : UIImageView = {
    var imageView = UIImageView()
    imageView.image = UIImage(named: "portada")
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var perfilImage : UIImageView = {
    var imageView = UIImageView()
    imageView.image = UIImage(named: "perfil")
    imageView.layer.cornerRadius = width / 6
    imageView.clipsToBounds = true
    imageView.layer.borderWidth = 3
    imageView.layer.borderColor = UIColor.ghostWhite.cgColor
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var infoSectionView : UIView  = {
    var view = UIView()
    view.backgroundColor = .clear
    return view
  }()
  
  lazy var perfilNombreLabel : UILabel = {
    var label = UILabel()
    label.textColor = .superDarkBlue
    label.font = .boldSystemFont(ofSize: 20)
    label.text = "Angel Duarte"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var descripcionLabel : UILabel = {
    var label = UILabel()
    label.numberOfLines = 3
    label.font = .systemFont(ofSize: 12)
    label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    label.lineBreakMode = .byWordWrapping
    label.textColor = .superDarkBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var stackButtons : UIStackView = {
    var stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 10
    stack.distribution = .fill
    return stack
  }()
  
  lazy var addPostButton: UIButton = {
    let button = UIButton()
    
    var config = UIButton.Configuration.filled()
    config.baseBackgroundColor = .newBlue
    config.baseForegroundColor = .white
    config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
    config.cornerStyle = .small
    let boldFont = UIFont.boldSystemFont(ofSize: 14)
    config.attributedTitle = AttributedString("Agregar publicación", attributes: AttributeContainer([
      .font: boldFont
    ]))
    button.configuration = config
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var editProfileButton: UIButton = {
    let button = UIButton()
    
    var config = UIButton.Configuration.filled()
    config.baseBackgroundColor = .lightBlue
    config.baseForegroundColor = .superDarkBlue
    config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
    config.cornerStyle = .small
    let boldFont = UIFont.boldSystemFont(ofSize: 14)
    config.attributedTitle = AttributedString("Editar perfil", attributes: AttributeContainer([
      .font: boldFont
    ]))
    button.configuration = config
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var configuracionButton: UIButton = {
    let button = UIButton()
    
    var config = UIButton.Configuration.filled()
    config.image = UIImage(named: "config")?.withRenderingMode(.alwaysTemplate)
    config.imagePlacement = .top
    config.baseBackgroundColor = .lightBlue
    config.baseForegroundColor = .superDarkBlue
    button.configuration = config
    
    button.imageView?.contentMode = .scaleAspectFit
    button.imageView?.clipsToBounds = true
    
    button.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      button.heightAnchor.constraint(equalToConstant: 35),
      button.widthAnchor.constraint(equalToConstant: 35)
    ])
    
    if let imageView = button.imageView {
      imageView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: button.topAnchor, constant: 5),
        imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 5),
        imageView.heightAnchor.constraint(equalToConstant: 25),
        imageView.widthAnchor.constraint(equalToConstant: 25)
      ])
    }
    return button
  }()
  
  lazy var detallesLabel : UILabel = {
    var label = UILabel()
    label.textColor = .superDarkBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavigation()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .ghostWhite
    
    configTitle()
    initUI()
  }
  
  func configTitle(){
    title = "Perfil Name"
    navigationController?.navigationBar.prefersLargeTitles = false
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    
  }
  
  func initUI(){
    portadaImage.image = user?.userPortada
    view.addSubview(portadaImage)
    portadaImage.addAnchorsAndSize(width: width, height: width / 2, left: 0, top: 0, right: 0, bottom: nil)
    
    perfilImage.image = user?.userPhoto
    view.addSubview(perfilImage)
    perfilImage.addAnchorsAndSize(width: width / 3, height: width / 3, left: 20, top: 100, right: nil, bottom: nil)
    
    view.addSubview(infoSectionView)
    infoSectionView.addAnchorsAndSize(width: nil, height: 200, left: 0, top: 0, right: 0, bottom: nil, withAnchor: .top, relativeToView: perfilImage)
    
    perfilNombreLabel.text = user?.name
    infoSectionView.addSubview(perfilNombreLabel)
    perfilNombreLabel.addAnchors(left: 10, top: 10, right: nil, bottom: nil)
    
    descripcionLabel.text = user?.descripcion
    infoSectionView.addSubview(descripcionLabel)
    descripcionLabel.addAnchors(left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: perfilNombreLabel)
    
    infoSectionView.addSubview(stackButtons)
    stackButtons.addAnchorsAndSize(width: nil, height: 35, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: descripcionLabel)
    
    
    stackButtons.addArrangedSubview(addPostButton)
    stackButtons.addArrangedSubview(editProfileButton)
    stackButtons.addArrangedSubview(configuracionButton)
    
    addPostButton.addAnchorsAndSize(width: nil, height: 35, left: nil, top: nil, right: nil, bottom: nil)
    
    editProfileButton.addAnchorsAndSize(width: nil, height: 35, left: nil, top: nil, right: nil, bottom: nil)
    
    configuracionButton.addAnchorsAndSize(width: 35, height: 35, left: nil, top: nil, right: nil, bottom: nil)
    
  }
  
  
}
