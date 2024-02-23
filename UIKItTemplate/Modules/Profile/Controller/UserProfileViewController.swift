// UserProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show user account information
final class UserProfileViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var accountTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        table.separatorStyle = .none
        table.register(UserProfileCell.self, forCellReuseIdentifier: UserProfileCell.reuseID)
        table.register(StoriesViewCell.self, forCellReuseIdentifier: StoriesViewCell.reuseID)
        table.register(UserPhotosViewCell.self, forCellReuseIdentifier: UserPhotosViewCell.reuseID)
        return table
    }()

    // MARK: - Private Properties

    private var dataStorage = DataStorage()
    private var photoNames: [String]?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(accountTableView)
        view.disableTARMIC()
        setupConstraints()
        setNavigationBarItems()
    }

    private func setNavigationBarItems() {
        let myTitleView = TitleView()
        navigationItem.setLeftBarButton(UIBarButtonItem(customView: myTitleView), animated: false)
        navigationController?.navigationBar.tintColor = .black
    }
}

// MARK: - Constraints

private extension UserProfileViewController {
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

extension UserProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataStorage.userProfileSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = dataStorage.userProfileSections
        let section = sections[indexPath.section]
        switch section {
        case let .userProfile(user):
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: UserProfileCell.reuseID, for: indexPath) as? UserProfileCell
            else { return .init() }
            cell.setupWith(user)
            cell.handler = { [weak self] urlString in
                let webViewController = WebViewController(urlString: urlString)
                webViewController.modalPresentationStyle = .fullScreen
                self?.present(webViewController, animated: true)
            }
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoriesViewCell.reuseID,
                for: indexPath
            ) as? StoriesViewCell else { return .init() }
            cell.setupWith(dataStorage.stories, hasDefaultStory: false)
            return cell

        case let .photoGallery(photoNames):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserPhotosViewCell.reuseID, for: indexPath
            ) as? UserPhotosViewCell
            else { return .init() }
            self.photoNames = photoNames
            cell.setupDelegates(delegate: self, dataSource: self)
            return cell
        default:
            return .init()
        }
    }
}

// MARK: - ProfileViewController: UICollectionViewDelegate

extension UserProfileViewController: UICollectionViewDelegate {}

// MARK: - ProfileViewController: UICollectionViewDataSource

extension UserProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoNames?.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.reuseId,
            for: indexPath
        ) as? PhotoCollectionViewCell else {
            return .init()
        }
        guard let photoNames else { return .init() }
        let imageName = photoNames[indexPath.item]
        cell.setupWith(imageName: imageName)
        return cell
    }
}
