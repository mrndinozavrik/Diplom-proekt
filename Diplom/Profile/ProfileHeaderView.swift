//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by 마리나 on 13.05.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    //MARK: - Properties
    
    private(set) var statusText = ""
    
    private let whiteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        return view
    }()

    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "Cat")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Suga"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "On vacations..."
        label.textColor = .gray
        label.minimumScaleFactor = 0.5
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var statusField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 15
        textField.placeholder = "Enter your status"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(enterYourStatus), for: .editingChanged)
        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        textField.indent(size: 10)
        return textField
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViews()
        setupAutoLayout()
        addTapGestureRecognizer(to: avatarImageView)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private func
    
    private func setupViews() {
        addSubview(whiteView)
        [avatarLabel, statusButton, statusLabel, statusField, avatarImageView].forEach { whiteView.addSubview($0) }
//        addSubview(avatarLabel)
//        addSubview(statusButton)
//        addSubview(statusLabel)
//        addSubview(statusField)
//        addSubview(avatarImageView)
    }
    
    private func addTapGestureRecognizer(to imageView: UIImageView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.isUserInteractionEnabled = true
    }
    
    private func findViewController() -> UIViewController? {
        var responder: UIResponder? = self
        while !(responder is UIViewController) && responder != nil {
            responder = responder?.next
        }
        return responder as? UIViewController
    }
    
    //MARK: - Actions
    
    @objc private func avatarTapped() {
        guard findViewController() is ProfileViewController else { return }

    }
    
    @objc private func buttonPressed() {
        if statusField.text == ""{
            statusField.placeholder = "Введите статус"
            UIView.animate(withDuration: 1) { [weak self] in
                guard let self else { return }
                statusField.backgroundColor = #colorLiteral(red: 0.9112033248, green: 0.4642114639, blue: 0.7697302103, alpha: 1)
            } completion: { _ in
                UIView.animate(withDuration: 1) { [weak self] in
                    guard let self else { return }
                    statusField.backgroundColor = .systemGray6
                }
            }
        }else{
            statusLabel.text = statusText
            statusField.text = ""
            print("Status Text: \(statusText)")
        }
    }
    
    @objc private func enterYourStatus(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc func hideKeyboard() {
        endEditing(true)
    }
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            whiteView.leadingAnchor.constraint(equalTo: leadingAnchor),
            whiteView.topAnchor.constraint(equalTo: topAnchor),
            whiteView.trailingAnchor.constraint(equalTo: trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            
            avatarLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            avatarLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            
            statusLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -60),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            
            statusField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 11),
            statusField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusField.heightAnchor.constraint(equalToConstant: 40),
            
            
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

//MARK: - Extension
//extension UITextField {
//    func indent(size:CGFloat) {
//        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
//        self.leftViewMode = .always
//    }
//}


