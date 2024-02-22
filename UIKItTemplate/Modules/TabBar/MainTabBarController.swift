// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General app's tabBarController
final class MainTabBarController: UITabBarController {
    // MARK: - Constants

    /// Titles for TabBarController
    enum Titles {
        /// NewsLineViewController title
        static let newsLine = "Лента"
        /// NotificationsViewController title
        static let notifications = "Уведомления"
        /// NotificationsViewController title
        static let profile = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        let newsLineViewController = UINavigationController(rootViewController: NewsLineViewController())
        let newsLineItem = UITabBarItem(
            title: Titles.newsLine,
            image: .home,
            tag: 0
        )
        newsLineViewController.tabBarItem = newsLineItem

        let notificationsViewController = UINavigationController(rootViewController: NotificationsViewController())
        let notificationsItem = UITabBarItem(
            title: Titles.notifications,
            image: .notification,
            tag: 1
        )
        notificationsViewController.tabBarItem = notificationsItem

        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        let profileItem = UITabBarItem(
            title: Titles.profile,
            image: .profile,
            tag: 2
        )
        profileViewController.tabBarItem = profileItem

        viewControllers = [newsLineViewController, notificationsViewController, profileViewController]
        selectedIndex = 2
    }
}
