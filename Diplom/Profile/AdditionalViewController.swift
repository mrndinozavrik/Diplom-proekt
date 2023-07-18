//
//  AdditionalViewController.swift
//  Diplom
//
//  Created by 마리나 on 07.07.2023.
//

import UIKit

class AdditionalViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let detailView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let header: UILabel = {
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
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
    }
    
    //MARK: - Metods
    func setupDetailVC(model: PostModel ,indexPath: IndexPath) {
        header.text = model.author
        postImage.image = UIImage(named: model.image)
        descriptionLabel.text = model.description
    }
    
    //MARK: - Layout
    private func layout() {
        let inset: CGFloat = 16
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            detailView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            detailView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
        
        [header, postImage, descriptionLabel].forEach { detailView.addSubview($0) }
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: inset),
            header.topAnchor.constraint(equalTo: detailView.topAnchor, constant: inset),
            header.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -inset),
            
            postImage.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: 0),
            postImage.topAnchor.constraint(equalTo: header.bottomAnchor, constant: inset),
            postImage.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: 0),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: detailView.leadingAnchor, constant: inset),
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: detailView.trailingAnchor, constant: -inset)
        ])
    }
    
}
