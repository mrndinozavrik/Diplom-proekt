//
//  CustomTableViewCell.swift
//  Navigation
//
// Created by 마리나 on 19.06.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    //MARK: private
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let postImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2

        return label
    }()
    
    //MARK: life cycle    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLabel.text = nil
        postImage.image = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    //MARK: func
    
    func setupCell(model: PostModel) {
        headerLabel.text = model.author
        postImage.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
        if likesLabel.isUserInteractionEnabled == true{
            likesLabel.text = String("Likes: \(model.likes + 1)")}
        if whiteView.isUserInteractionEnabled == true{
            viewsLabel.text = String("Views \(model.views + 1)")}

    }

//MARK: private funcs
    
    private func customiseCell() {
        
    }
    
    private func layout() {
        let inset: CGFloat = 16
        let width: CGFloat = 100
        [whiteView, headerLabel, postImage, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        NSLayoutConstraint.activate([
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            headerLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            headerLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            headerLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            postImage.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            postImage.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: inset),
            postImage.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            likesLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset),
            likesLabel.widthAnchor.constraint(equalToConstant: width),
            
            viewsLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset),
            viewsLabel.widthAnchor.constraint(equalToConstant: width),
            
        ])
    }
    

}
