// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show user account information
final class ProfileViewController: UIViewController {
    
    // MARK: - Visual Components

    private lazy var postTableView: UITableView = {
        let table = UITableView()
//        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        table.separatorStyle = .none
        table.register(StoriesViewCell.self, forCellReuseIdentifier: StoriesViewCell.reuseID)
        table.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.reuseID)
        table.register(RecommendationViewCell.self, forCellReuseIdentifier: RecommendationViewCell.reuseID)
        return table
    }()
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        setNavigationBarItems()
    }
    
    private func setNavigationBarItems() {
        let logoItem = UIBarButtonItem(title: nil, image: .logo)
        let messageItem = UIBarButtonItem(title: nil, image: .message)
        navigationItem.rightBarButtonItem = messageItem
        navigationItem.leftBarButtonItem = logoItem
        navigationController?.navigationBar.tintColor = .black
    }
}
