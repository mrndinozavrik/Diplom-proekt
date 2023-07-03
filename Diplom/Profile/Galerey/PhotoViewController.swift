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
        collection.reloadData()
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
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
    
}


extension PhotoViewController: UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//            1
//        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionGalery.identifier, for: indexPath) as! CustomCollectionGalery
        cell.setupCell(photosModel: PhotosModel(photo: String(indexPath.row + 1)))
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
