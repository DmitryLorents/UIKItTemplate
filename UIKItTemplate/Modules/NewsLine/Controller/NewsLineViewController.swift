// NewsLineViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Main screen with posts and recomendations
final class NewsLineViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset: CGFloat = 33
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
        table.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.reuseID)
        table.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseID)
        table.register(RecommendationCell.self, forCellReuseIdentifier: RecommendationCell.reuseID)
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
                .dequeueReusableCell(withIdentifier: StoriesCell.reuseID, for: indexPath) as? StoriesCell
            else {
                return .init()
            }
            cell.setupWith(storage.stories)
            return cell
        case 1:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostCell.reuseID, for: indexPath) as? PostCell
            else {
                return .init()
            }
            let post = storage.posts.randomElement()
            cell.setupWith(post)
            return cell
        case 2:
            guard let cell = tableView
            RecommendationCelleCell(
                withIdentifier: RecomendRecommendationCell,
                for: indexPath
            ) as? RecomendationCell
            else {
                return .init()
            }
            let recomendations = storage.recomendations
            cell.setupWith(recomendations)
            return cell
        default:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostCell.reuseID, for: indexPath) as? PostCell
            else {
                return .init()
            }
            let post = storage.posts.randomElement()
            cell.setupWith(post)
            return cell
        }
    }
}
