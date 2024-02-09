// BirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// List of persons with birthday date
final class BirthdayViewController: UIViewController {
    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        title = "Birthday Reminder"
        view.backgroundColor = .green
    }
}
