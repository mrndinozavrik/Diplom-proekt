//
//  ProfileViewController.swift
//  Navigation
//
//  Created by 마리나 on 13.05.2023.
//

import UIKit

final class ProfileViewController: UIViewController{
    
    
    
    //MARK: - Private
    
    
    private var postModel = PostModel.makePostModel()
    private let photoModel = PhotosModel.makePhotosModel()
    private let headerHeight: CGFloat = 200
    private let photosCellHeight: CGFloat = 150
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemGray6
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    private let header = ProfileHeaderView()
//    header.delegate = self
    
    private var leadingAvatar = NSLayoutConstraint()
    private var topAvatar = NSLayoutConstraint()
    private var heightAvatar = NSLayoutConstraint()
    private var widthAvatar = NSLayoutConstraint()
    
    let avatar: UIImageView = {
        var view = UIImageView(image: UIImage(named: "Cat"))
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.opacity = 0
        return view
    }()
    
    let cross: UIButton = {
        var view = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 100, width: 50, height: 50))
        view.setImage(UIImage(systemName: "cross.fill"),for : .normal)
        view.layer.opacity = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var initialRect: CGRect = .zero
    
    private let newView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.opacity = 0
        return view
    }()
    // MARK: - life cycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
        setupGesture()
        view.addSubview(header)
    }
    
    private func layout() {
        [tableView, newView, avatar, cross].forEach { view.addSubview($0) }
        //        [tableView].forEach { view.addSubview($0) }
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            newView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            newView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            cross.trailingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: -32),
            cross.topAnchor.constraint(equalTo: avatar.topAnchor, constant: 32),
            cross.widthAnchor.constraint(equalToConstant: 60),
            cross.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    func setupGesture() {
        //        let avatarImageViewTap = UITapGestureRecognizer(target: self, action: #selector(avatarImageViewAction))
        //        _ = ProfileHeaderView().avatarImageView
        //        header.avatarImageView.isUserInteractionEnabled = true
        //        header.avatarImageView.addGestureRecognizer(avatarImageViewTap)
        
        let closeImage = UITapGestureRecognizer(target: self, action: #selector(closeAvatarAction))
        cross.addGestureRecognizer(closeImage)
    }
    
    @objc private func closeAvatarAction() {
        closeAvatarAnimation(rect: initialRect)
    }
    
    @objc private func openImageAnimate(image: UIImage?, imageFrame: CGRect) {
            avatar.image = image
            self.avatar.layer.opacity = 1
            self.avatar.layer.borderWidth = 0
            avatar.frame = CGRect(x: imageFrame.origin.x,
                                  y: imageFrame.origin.y,
                                  width: imageFrame.width,
                                  height: imageFrame.height)
            UIView.animate(withDuration: 0.5) {
                self.newView.layer.opacity = 0.5
                self.avatar.layer.cornerRadius = 0
                self.avatar.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                self.avatar.center = self.view.center
            } completion: { _ in
                UIView.animate(withDuration: 0.3) {
                    self.cross.layer.opacity = 1
                }
            }

        }
        
        //MARK: private func
    private func closeAvatarAnimation(rect: CGRect) {
        UIView.animate(withDuration: 0.3) {
            self.cross.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.newView.layer.opacity = 0
                self.avatar.frame = rect
                self.avatar.layer.cornerRadius = 75
            } completion: { _ in
                self.avatar.layer.opacity = 0
            }
        }
    }
    
    @objc private func avatarImageViewAction(image: UIImage?, imageFrame: CGRect) {
        avatar.image = image
                self.avatar.layer.opacity = 1
                self.avatar.layer.borderWidth = 0
                avatar.frame = CGRect(x: imageFrame.origin.x,
                                      y: imageFrame.origin.y,
                                      width: imageFrame.width,
                                      height: imageFrame.height)
                UIView.animate(withDuration: 0.5) {
                    self.newView.layer.opacity = 0.5
                    self.avatar.layer.cornerRadius = 0
                    self.avatar.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    self.avatar.center = self.view.center
                } completion: { _ in
                    UIView.animate(withDuration: 0.3) {
                        self.cross.layer.opacity = 1
                    }
                }
    }

//    override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//
//            header.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
//    }
//
}
//MARK: extentios
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
           true
       }
       
       func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               postModel.remove(at: indexPath.row)
               tableView.deleteRows(at: [indexPath], with: .left)
           }
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        header.delegate = self
        
        if section == 0 {
            return header
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let vc = PhotoViewController()
            navigationController?.pushViewController(vc, animated: false)
        } else {
            if postModel[indexPath.row].prosmotr == false{
                postModel[indexPath.row].views += 1
                postModel[indexPath.row].prosmotr = true
                tableView.reloadData()
            }
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        }
        return UITableView.automaticDimension
    }
        
    
}

extension ProfileViewController: UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return postModel.count
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postModel[indexPath.row])
            return cell
        }
    }
}

extension ProfileViewController: ProfileHeaderViewDelegate {
    func protocolFunction(image: UIImage?, imageRect: CGRect) {
        let rect = header.frame
        let currentHeaderRect = tableView.convert(rect, to: view)
        initialRect = CGRect(x: imageRect.origin.x,
                             y: imageRect.origin.y + currentHeaderRect.origin.y,
                             width: imageRect.width,
                             height: imageRect.height)
        
        openImageAnimate(image: image, imageFrame: initialRect)
    }
}
extension ProfileViewController: PostViewCellDelegate {
    func increseNumbersOfLikesDelegate(indexPath: IndexPath) {
        postModel[indexPath.row].likes += 1
        tableView.reloadData()
    }
}
