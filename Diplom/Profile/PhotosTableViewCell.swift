//
//  PhotosTableViewCell.swift
//  Navigation
//
// Created by 마리나 on 19.06.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    private let arrow: UIImageView = {
        var view = UIImageView(image: UIImage(systemName: "arrow.right"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        var view = UIImageView(image: UIImage(named: "Cat"))
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 75
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let photosLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = .systemFont(ofSize: 18, weight: .bold, width: .standard)
        return label
    }()
     
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    private var photoModel = PhotosModel.makePhotosModel()
    
    //MARK: life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
//        customiseCollection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupPhotoForTableCell(model: GalleryModel) {
//        labelView.text = "Photos"
//        arrowView.text = ">"
//    }
    
//MARK: private metods
    private func layout() {
        let inset: CGFloat = 0
        let photoLabelInset: CGFloat = 12
        
        [photosLabel, arrow , photoCollectionView].forEach { contentView.addSubview($0) }
        NSLayoutConstraint.activate([
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: photoLabelInset),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: photoLabelInset),
            
            arrow.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -photoLabelInset),
            arrow.heightAnchor.constraint(equalToConstant: 20),
            arrow.widthAnchor.constraint(equalToConstant: 20),
            
            photoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photoCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            photoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}
    


//MARK: UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setupCell(photosModel: PhotosModel(photo: String(indexPath.row + 1)))
        return cell
    }


}

//MARK: UICollectionViewDelegateFlowLayout
extension UITableViewCell: UICollectionViewDelegateFlowLayout {

    private var insetMinimumInterItemSpasing: CGFloat { return 8 }
    private var insetForSection: CGFloat { return 12 }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 3 * insetMinimumInterItemSpasing - 2 * insetForSection) / 4
        return CGSize(width: width, height: width)
    }

    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        insetMinimumInterItemSpasing
    }


    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: insetForSection, left: insetForSection, bottom: insetForSection, right: insetForSection)
    }


 
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        insetMinimumInterItemSpasing
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoGalery = PhotoViewController()
                UIApplication.topViewController()!.navigationController?.pushViewController(photoGalery, animated: true)
  
    }
}
