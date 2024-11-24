//
//  PostTableViewCell.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 24/11/24.
//

import Foundation
import UIKit

class PostTableViewCell : UITableViewCell{
  
  lazy var profileInfoView : ProfileInfoView = {
    var profileInfoView = ProfileInfoView()
    return profileInfoView
  }()
  
  lazy var postTextLabel : UILabel = {
    var label = UILabel()
    label.backgroundColor = .clear
    label.font = .systemFont(ofSize: 10)
    label.numberOfLines = 3
    label.text = ""
    label.textColor = .superDarkBlue
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  lazy var postImage : UIImageView = {
    var imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .clear
    initUI()
  }
  
  func initUI(){
    self.addSubview(profileInfoView)
    profileInfoView.addAnchorsAndSize(width: nil, height: 46, left: 10, top: 10, right: 10, bottom: nil)
    
    self.addSubview(postTextLabel)
    postTextLabel.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: profileInfoView)
    
  }
  
  func setupData(post : Post){
    profileInfoView.setupData(post: post)
    postTextLabel.text = post.text
    postImage.image = post.image
    
    setupImage(image: post.image)
  }
  
  func setupImage(image : UIImage){
    let imageAspectRatio = image.size.height / image.size.width
    let newHeight = width * imageAspectRatio
    
    self.addSubview(postImage)
    postImage.addAnchorsAndSize(width: width, height: newHeight , left: 0, top: 10, right: 0, bottom: nil, withAnchor: .top, relativeToView: postTextLabel)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
