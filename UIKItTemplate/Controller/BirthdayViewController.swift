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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        title = "Birthday Reminder"
        view.backgroundColor = .systemBackground
        view.addSubViews(firstPersonView, secondPersonView)
    }
}
