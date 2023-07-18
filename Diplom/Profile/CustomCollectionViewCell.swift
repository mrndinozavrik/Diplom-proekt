//
//  CustomCollectionViewCell.swift
//  Navigation
//
// Created by 마리나 on 19.06.2023.
//

import UIKit

final class CustomCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(photosModel: PhotosModel) {
        imageView.image = UIImage(named: photosModel.photo)

    }
    
    
//    private func customiseCell() {
//        contentView.backgroundColor = .systemGray5
//        contentView.layer.cornerRadius = 5
//    }
    
    private func layout() {
        let safeArea = contentView.safeAreaLayoutGuide
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

