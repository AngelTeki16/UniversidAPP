//
//  InicioViewController.swift
//  UniversidAPP
//
//  Created by Angel Duarte on 24/11/24.
//

import UIKit

class InicioViewController: ViewController {
  
  var user : User?
  
  var dataSource = [Post]()
  
  lazy var postTable : UITableView = {
    var table = UITableView()
    table.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
    table.backgroundColor = .ghostWhite
    table.showsVerticalScrollIndicator = false
    return table
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
    view.backgroundColor = .ghostWhite
    
    getPost()
    initUI()
  }
  
  
  func createPost() -> Post?{
    guard let postImage = UIImage(named: "portada"),
          let user = user else { return nil }
    
    let post = Post(user: user, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", image: postImage, date: "2024/11/24 17:00")
    
    return post
  }
  
  
  func getPost(){
    guard let post = createPost() else { return }
    
    dataSource.append(post)
    dataSource.append(post)
    dataSource.append(post)
    
  }
  
  func initUI(){
    postTable.dataSource = self
    postTable.delegate = self
    view.addSubview(postTable)
    postTable.addAnchors(left: 20, top: 50, right: 20, bottom: 20)
  }
  
}


extension InicioViewController : UITableViewDataSource, UITableViewDelegate{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
    let post = dataSource[indexPath.row]
    cell.setupData(post: post)
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let post = dataSource[indexPath.row]
    let image = post.image
    let imageAspectRatio = image.size.height / image.size.width
    let viewWidth = self.view.frame.width
    let newHeight = viewWidth * imageAspectRatio
    return newHeight + 130
  }
  
}
