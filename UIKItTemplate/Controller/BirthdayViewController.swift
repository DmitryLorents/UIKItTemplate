// BirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// List of persons with birthday date
final class BirthdayViewController: UIViewController {
    // MARK: - Private Properties

    private let firstPersonView = PersonDataView(
        imagename: "person1",
        name: "Helena Link",
        daysRemaing: 0,
        subText: "10.03 - turns 25!",
        position: 0
    )
    private let secondPersonView = PersonDataView(
        imagename: "person2",
        name: "Verona Tusk",
        daysRemaing: 10,
        subText: "20.03 - turns 39",
        position: 1
    )
    private let thirdPersonView = PersonDataView(
        imagename: "person3",
        name: "Alex Smith",
        daysRemaing: 42,
        subText: "21.04 - turns 51",
        position: 2
    )
    private let fourPersonView = PersonDataView(
        imagename: "person4",
        name: "Tom Johnson",
        daysRemaing: 87,
        subText: "05.06 - turns 18",
        position: 3
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        addPlusButtonToNavBar()
    }

    // MARK: - Private Methods

    private func setUI() {
        title = "Birthday Reminder"
        view.backgroundColor = .systemBackground
        view.addSubViews(firstPersonView, secondPersonView, thirdPersonView, fourPersonView)
    }

    private func addPlusButtonToNavBar() {
        let plusButton = UIBarButtonItem(systemItem: .add)
        plusButton.target = self
        plusButton.action = #selector(addButtonAction)
        navigationItem.rightBarButtonItem = plusButton
    }

    @objc private func addButtonAction() {
        let personDetailVC = PersonDetailsViewController()
        present(personDetailVC, animated: true)
    }
}
