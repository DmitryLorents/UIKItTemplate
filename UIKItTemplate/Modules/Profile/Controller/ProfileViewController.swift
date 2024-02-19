// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ProfileViewController: UIViewController {
    enum Constants {
        enum Text {
            static let title = "Профиль"
        }
    }

    // MARK: - Constants

    // MARK: - IBOutlets

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        title = Constants.Text.title
    }
}
