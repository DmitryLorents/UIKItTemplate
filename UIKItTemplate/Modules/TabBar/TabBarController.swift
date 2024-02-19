// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General app's tabBarController
final class TabBarController: UITabBarController {

    // MARK: - Constants

    enum Constants {
        enum Images {
            static let catalog = "catalog"
            static let basket = "basket"
            static let profile = "profile"
        }

        enum Titles {
            static let catalog = "Каталог"
            static let basket = "Корзина"
            static let profile = "Профиль"
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        let catalogNavVC = UINavigationController(rootViewController: CatalogViewController())
        let catalogItem = UITabBarItem(
            title: Constants.Titles.catalog,
            image: UIImage(named: Constants.Images.catalog),
            tag: 0
        )
        catalogNavVC.tabBarItem = catalogItem

        let basketNavVC = UINavigationController(rootViewController: BasketViewController())
        let basketItem = UITabBarItem(
            title: Constants.Titles.basket,
            image: UIImage(named: Constants.Images.basket),
            tag: 1
        )
        basketNavVC.tabBarItem = basketItem

        let profileNavVC = UINavigationController(rootViewController: ProfileViewController())
        let profileItem = UITabBarItem(
            title: Constants.Titles.profile,
            image: UIImage(named: Constants.Images.profile),
            tag: 2
        )
        profileNavVC.tabBarItem = profileItem

        viewControllers = [catalogNavVC, basketNavVC, profileNavVC]
        view.backgroundColor = .systemBackground
        view.tintColor = .magentaApp
    }
}
