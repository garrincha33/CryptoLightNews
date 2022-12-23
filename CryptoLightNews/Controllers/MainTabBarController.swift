//
//  MainTabBarController.swift
//  CryptoLightNews
//
//  Created by Richard Price on 15/12/2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private enum Sizes {
        static let tabInsets = UIEdgeInsets(top: 2, left: .zero, bottom: -2, right: .zero)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateTabInsects()
        updateTabColorScheme()
        view.backgroundColor = .darkGray
    }
    private func setupNavControllers(with rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }
    private func setupUI() {
        viewControllers = [
            setupNavControllers(with: UIViewController(), title: "News", image: #imageLiteral(resourceName: "cryptoNews")),
            setupNavControllers(with: UIViewController(), title: "Prices", image: #imageLiteral(resourceName: "prices_new"))
        ]
    }
    private func updateTabInsects() {
        guard let items = tabBar.items else {return}
        for item in items {
            item.title = ""
            item.imageInsets = Sizes.tabInsets
        }
    }
    private func updateTabColorScheme() {
        tabBar.isTranslucent = true
        tabBar.barTintColor = .clear
        tabBar.tintColor = .systemGreen
        UINavigationBar.appearance().prefersLargeTitles = true
    }
}
