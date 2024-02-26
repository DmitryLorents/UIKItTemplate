// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Screen with detailed information for products
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    /// Constants for NotificationsViewController
    private enum Constants {
        /// Standard insets
        enum Inset {
            /// Top inset value
            static let topInset: CGFloat = 33
            /// General inset value
            static let generalInset: CGFloat = 20
        }

        /// Titles related to class items
        enum Text {
            /// Title for requestSubscriptLabel
            static let subscribeRequest = "Запросы на подписку"
            /// Class title
            static let title = "Уведомления"
        }
    }

    // MARK: - Visual Components

    private let requestSubscriptLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.subscribeRequest
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaRegular(16)
        return label
    }()

    private lazy var mainTableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        table.separatorStyle = .none
        table.register(NotificationViewCell.self, forCellReuseIdentifier: NotificationViewCell.reuseID)
        return table
    }()

    // MARK: - Private Properties

    private let dataStorage = DataStorage()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupUI() {
        title = Constants.Text.title
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubviews(mainTableView, requestSubscriptLabel)
        view.disableTARMIC()
    }
}

// Set constraints
private extension NotificationsViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            requestSubscriptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            requestSubscriptLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.topAnchor.constraint(equalTo: requestSubscriptLabel.bottomAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - NotificationsViewController: UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataStorage.headerTitles[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        dataStorage.headerTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let headerTitle = dataStorage.headerTitles[section]
        return dataStorage.noticeMap[headerTitle]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: NotificationViewCell.reuseID, for: indexPath) as? NotificationViewCell
        else {
            return .init()
        }
        let headerTitle = dataStorage.headerTitles[indexPath.section]
        if let notices = dataStorage.noticeMap[headerTitle] {
            let notice = notices[indexPath.row]
            cell.setupWith(notice)
        }
        return cell
    }
}
