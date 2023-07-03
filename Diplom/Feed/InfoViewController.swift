//
//  InfoViewController.swift
//  Diplom
//
//  Created by 마리나 on 01.07.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let infoButton = UIButton(type: .system)
        infoButton.frame = CGRect(origin: CGPoint(x: 140, y: 300), size: CGSize(width: 110, height: 50))
        infoButton.setTitle("Info", for: .normal)
        infoButton.backgroundColor = .systemMint
        infoButton.tintColor = .black
        infoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        infoButton.layer.cornerRadius = 20
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        view.addSubview(infoButton)
    }
    
    @objc func infoButtonTapped(){
        let alertController = UIAlertController(title: "Think twice", message: "Are you sure?", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Yes", style: .default) {_ in print("Yes tapped")}
        let action2 = UIAlertAction(title: "No", style: .default) {_ in print("No tapped")}
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        present(alertController, animated: true)
    }
}
