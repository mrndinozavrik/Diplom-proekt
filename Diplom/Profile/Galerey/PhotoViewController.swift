//
//  PhotoViewController.swift
//  Navigation
//
//  Created by 마리나 on 28.06.2023.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    private var photoModel = PhotosModel.makePhotosModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
//        collection.reloadData()
        return collection
    }()
    
    private var initialImageRect: CGRect = .zero
    
    private let close: UIButton = {
        var view = UIButton(frame: CGRect(x: UIScreen.main.bounds.width - 66, y: 100, width: 50, height: 50))
        view.setImage(UIImage(systemName: "xmark"), for: .normal)
        view.layer.opacity = 0
        view.backgroundColor = .systemGray6
        return view
    }()
        
    private let newView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .white
        view.layer.opacity = 0
        return view
    }()
        
    private var animatingView: UIImageView = {
        let view = UIImageView()
        return view
    }()
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
        setupGestures()
        self.title = "Photo Gallery"
    }
    
    private func layout() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func setupGestures() {
            let closeGesture = UITapGestureRecognizer(target: self, action: #selector(closeImageAction))
            close.addGestureRecognizer(closeGesture)
        }
        
    //MARK: - Actions
        @objc private func closeImageAction(rect: CGRect) {
            closeImageAnimation(rect: initialImageRect)
        }
        
    //MARK: - Animations
    private func closeImageAnimation(rect: CGRect) {
        UIView.animate(withDuration: 0.3) {
            self.close.layer.opacity = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.newView.layer.opacity = 0
                self.animatingView.frame = CGRect(x: rect.origin.x,
                                                  y: rect.origin.y,
                                                  width: self.initialImageRect.width,
                                                  height: self.initialImageRect.height)
            } completion: { _ in
                self.animatingView.layer.opacity = 0
                
            }
        }
    }
    private func openImageAnimation(image: UIImage!, rect: CGRect!) {
        self.animatingView.frame = CGRect(x: rect.origin.x, y: rect.origin.y, width: rect.width, height: rect.height)
        UIView.animate(withDuration: 0.5) {
            self.newView.layer.opacity = 0.5
            self.animatingView.image = image
            self.animatingView.layer.opacity = 1
            
            self.animatingView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.animatingView.center = self.view.center
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.close.layer.opacity = 1
            }
        }
    }
    
}


extension PhotoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionGalery.identifier, for: indexPath) as! CustomCollectionGalery
        cell.setupCell(photosModel: PhotosModel(photo: String(indexPath.row + 1)))
        cell.setIndexPath(indexPath: indexPath)
        cell.delegate = self
        return cell
    }
        
}

extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4 - 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}

extension PhotoViewController: CustomCollectionGaleryDelegate {
    func protocolFnction(image: UIImage?, imageRect: CGRect, indexPath: IndexPath) {
        let itemRect = collectionView.layoutAttributesForItem(at: indexPath)
        initialImageRect = collectionView.convert(itemRect!.frame, to: collectionView.superview)
        openImageAnimation(image: image, rect: initialImageRect)

    }
}


