// NewsLineViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Main screen with posts and recomendations
final class NewsLineViewController: UIViewController {
    // MARK: - Constants

    /// Constants for NewsLineViewController
    private enum Constants {
        enum Inset {
            /// Standard inset from left or right side
            static let topInset: CGFloat = 33
            /// Inset per views
            static let generalInset: CGFloat = 20
        }
    }

    // MARK: - Visual Components

    private lazy var table: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        table.separatorStyle = .none
        table.register(StoriesViewCell.self, forCellReuseIdentifier: StoriesViewCell.reuseID)
        table.register(PostViewCell.self, forCellReuseIdentifier: PostViewCell.reuseID)
        table.register(RecommendationViewCell.self, forCellReuseIdentifier: RecommendationViewCell.reuseID)
        return table
    }()

    // MARK: - Private Properties

    private let storage = DataStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setNavigationBarItems()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(table)
        view.disableTARMIC()
    }

    private func setNavigationBarItems() {
        let logoItem = UIBarButtonItem(title: nil, image: .logo)
        let messageItem = UIBarButtonItem(title: nil, image: .message)
        navigationItem.rightBarButtonItem = messageItem
        navigationItem.leftBarButtonItem = logoItem
        navigationController?.navigationBar.tintColor = .black
    }
}

// Set constraints
private extension NewsLineViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - NewsLineViewController: UITableViewDataSource

extension NewsLineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: StoriesViewCell.reuseID, for: indexPath) as? StoriesViewCell
            else {
                return .init()
            }
            cell.setupWith(storage.stories)
            return cell
        case 1:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostViewCell.reuseID, for: indexPath) as? PostViewCell
            else {
                return .init()
            }
            let post = storage.posts.randomElement()
            cell.setupWith(post)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendationViewCell.reuseID, for: indexPath
            ) as? RecommendationViewCell
            else {
                return .init()
            }
            let recomendations = storage.recomendations
            cell.setupWith(recomendations)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostViewCell.reuseID, for: indexPath
            ) as? PostViewCell
            else {
                return .init()
            }
            let post = storage.posts.randomElement()
            cell.setupWith(post)
            return cell
        }
    }
}
