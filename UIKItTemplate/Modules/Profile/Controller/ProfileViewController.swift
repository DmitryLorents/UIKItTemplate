// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show user account information
final class ProfileViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var accountTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
//        table.separatorStyle = .none
        table.register(UserProfileCell.self, forCellReuseIdentifier: UserProfileCell.reuseID)
        table.register(UserStoriesViewCell.self, forCellReuseIdentifier: UserStoriesViewCell.reuseID)
        table.register(UserPhotosViewCell.self, forCellReuseIdentifier: UserPhotosViewCell.reuseID)
        return table
    }()

    // MARK: - Private Properties

    let dataStorage = DataStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        accountTableView.backgroundColor = .yellow
        view.addSubview(accountTableView)
        view.disableTARMIC()
        setupConstraints()
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

// MARK: - Constraints

private extension ProfileViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            accountTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accountTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            accountTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            accountTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - ProfileViewController: UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: UserProfileCell.reuseID, for: indexPath) as? UserProfileCell
            else { return .init() }
            return cell
        case 1:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: UserStoriesViewCell.reuseID,
                    for: indexPath
                ) as? UserStoriesViewCell
            else { return .init() }
            return cell
        case 2:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: UserPhotosViewCell.reuseID, for: indexPath) as? UserPhotosViewCell
            else { return .init() }
            return cell
        default:
            return .init()
        }
    }
}
