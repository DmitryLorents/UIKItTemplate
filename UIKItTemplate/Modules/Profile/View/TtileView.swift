// TtileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show title text and buttons in UserProfileViewController
final class TtileView {
    // MARK: - Types

    // MARK: - Constants

    private enum Constants {
        static let lockImage = "lock"
        static let plusImage = "moreLines"
        static let moreImage = "plusSquare"
    }

    // MARK: - IBOutlets

    // MARK: - Visual Components

    private lazy var lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.lockImage)
        return imageView
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: Constants.plusImage)
        button.setImage(image, for: .normal)
        return button
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: Constants.moreImage)
        button.setImage(image, for: .normal)
        return button
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers


    // MARK: - Life Cycle

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods
}
