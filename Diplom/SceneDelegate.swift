//
//  SceneDelegate.swift
//  Diplom
//
//  Created by 마리나 on 01.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
//        let profileViewController = ProfileViewController()
//        let _ = UINavigationController(rootViewController: profileViewController)
//        profileViewController.title = "Профиль"
//        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        
        let feedViewController = FeedViewController()
        let feedNavigationController = UINavigationController(rootViewController: feedViewController)
        feedViewController.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        
        let loginViewController = UINavigationController(rootViewController: LoginViewController())
        loginViewController.title = "Профиль"
        loginViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [loginViewController, feedNavigationController]
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .black
        tabBarController.selectedIndex = 0
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }

}

