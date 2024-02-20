// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Screen with detailed information for зкщвгсеы
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset: CGFloat = 33
            static let generalInset: CGFloat = 20
        }

        enum Text {
            static let subscribeRequest = "Запросы на подписку"
            static let today = "Сегодня"
            static let thisWeek = "На этой неделе"
            static let title = "Уведомления"
        }
    }

    // MARK: - Visual Components

    private lazy var requestSubscriptLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.subscribeRequest
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaRegular(14)
        label.textColor = .white
        label.sizeToFit()
        label.frame.origin = .zero
        return label
    }()

    private lazy var table: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .yellow
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 120
        table.separatorStyle = .none
        table.register(NotificationCell.self, forCellReuseIdentifier: NotificationCell.reuseID)
        return table
    }()

    // MARK: - Private Properties

    private let storage = DataStorage()

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
        view.addSubview(table)
        view.disableTARMIC()
    }
}

// Set constraints
private extension NotificationsViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {}

// MARK: - UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 5
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: NotificationCell.reuseID, for: indexPath) as? NotificationCell
        else {
            return .init()
        }
//            cell.setupWith(storage.stories)
        return cell
    }
}
