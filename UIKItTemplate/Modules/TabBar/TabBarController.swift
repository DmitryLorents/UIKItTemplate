// TabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General app's tabBarController
final class TabBarController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        enum Titles {
            static let newsLine = "Лента"
            static let notifications = "Уведомления"
            static let profile = "Профиль"
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        let newsLineVC = UINavigationController(rootViewController: NewsLineViewController())
        let newsLineItem = UITabBarItem(
            title: Constants.Titles.newsLine,
            image: .home,
            tag: 0
        )
        newsLineVC.tabBarItem = newsLineItem

        let notificationsVC = UINavigationController(rootViewController: NotificationsViewController())
        let notificationsItem = UITabBarItem(
            title: Constants.Titles.notifications,
            image: .notification,
            tag: 1
        )
        notificationsVC.tabBarItem = notificationsItem

        let profileNavVC = ProfileViewController()
        let profileItem = UITabBarItem(
            title: Constants.Titles.profile,
            image: .profile,
            tag: 2
        )
        profileNavVC.tabBarItem = profileItem

        viewControllers = [newsLineVC, notificationsVC, profileNavVC]
    }
}
