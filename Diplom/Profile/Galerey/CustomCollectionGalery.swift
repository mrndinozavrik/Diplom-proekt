//
//  CustomCollectionGalery.swift
//  Navigation
//
//  Created by 마리나 on 28.06.2023.
//

import UIKit

final class CustomCollectionGalery: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
//        image.layer.cornerRadius = 6
        image.clipsToBounds = true
//        image.image = UIImage(named: "1")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
//        prepareForReuse()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(photosModel: PhotosModel) {
        imageView.image = UIImage(named: photosModel.photo)

    }
    override func prepareForReuse() {
        imageView.image = nil
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
    
}
