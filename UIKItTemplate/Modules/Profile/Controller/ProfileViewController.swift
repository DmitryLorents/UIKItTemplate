// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
final class ProfileViewController: UIViewController {
    /// Constants related to ProfileViewController
    enum Constants {
        /// Class title
        static let title = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
