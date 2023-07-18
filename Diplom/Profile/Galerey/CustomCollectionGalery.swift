//
//  CustomCollectionGalery.swift
//  Navigation
//
//  Created by 마리나 on 28.06.2023.
//

import UIKit

protocol CustomCollectionGaleryDelegate: AnyObject {
    func protocolFnction(image: UIImage?, imageRect: CGRect, indexPath: IndexPath)
}

final class CustomCollectionGalery: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    
    weak var delegate: CustomCollectionGaleryDelegate?
    private var initialIndexPath = IndexPath()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        prepareForReuse()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(photosModel: PhotosModel) {
        imageView.image = UIImage(named: photosModel.photo)

    }
    override func prepareForReuse() {
//        imageView.image = nil
        let imagaTap = UITapGestureRecognizer(target: self, action: #selector(openImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imagaTap)
    }
    
    @objc private func openImage() {
        delegate?.protocolFnction(image: imageView.image, imageRect: imageView.frame, indexPath: initialIndexPath)
    }
    
    private func layout() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func customizeCell() {
        contentView.backgroundColor = .white
    }
    func setupCell(model: PhotosModel) {
        imageView.image = UIImage(named: model.photo)
    }
        
    func setIndexPath(indexPath: IndexPath) {
        initialIndexPath = indexPath
    }
    
}
