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

    private lazy var postTableView: UITableView = {
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

    private var storage = DataStorage()

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
        view.addSubview(postTableView)
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
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - NewsLineViewController: UITableViewDataSource

extension NewsLineViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        String(describing: storage.sections[section])
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        storage.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = storage.sections
        switch sections[section] {
        case .stories, .firstPost, .recomendation:
            return 1
        case let .remainingPosts(posts):
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = storage.sections[indexPath.section]
        switch section {
        case .stories:
            return makeStoryViewCell(tableView, indexPath)
        case .firstPost:
            let post = storage.firstPost
            return makePostViewCell(tableView, indexPath, post)
        case let .remainingPosts(posts):
            let post = posts[indexPath.row]
            return makePostViewCell(tableView, indexPath, post)
        case .recomendation:
            return makeRecomendationViewCell(tableView, indexPath)
        }
    }

    private func makeStoryViewCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: StoriesViewCell.reuseID, for: indexPath) as? StoriesViewCell
        else {
            return .init()
        }
        cell.setupWith(storage.stories)
        return cell
    }

    private func makePostViewCell(_ tableView: UITableView, _ indexPath: IndexPath, _ post: Post) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: PostViewCell.reuseID, for: indexPath) as? PostViewCell
        else {
            return .init()
        }
        cell.setupWith(post)
        return cell
    }

    private func makeRecomendationViewCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: RecommendationViewCell.reuseID, for: indexPath
        ) as? RecommendationViewCell
        else {
            return .init()
        }
        let recomendations = storage.recomendations
        cell.setupWith(recomendations)
        return cell
    }
}
