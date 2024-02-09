// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Authorisation screen
class LoginViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Public Properties

    // MARK: - Private Properties

    private lazy var birthdayImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 70, width: 125, height: 125))
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "birthdayLogoImage")
        return imageView
    }()

    private lazy var birthdayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 200, width: 0, height: 0))
        label.text = "Birthday\nReminder"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "customPurpleColor")
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-bold", size: 18)
        label.sizeToFit()
        label.center.x = view.center.x
        return label
    }()

    private let signInLabel: UILabel = .createRedLabel(size: 26, text: "Sign in", yPosition: 266)
    private let emailLabel: UILabel = .createRedLabel(size: 16, text: "Email", yPosition: 318)
    private let passwordLabel: UILabel = .createRedLabel(size: 16, text: "Password", yPosition: 393)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubViews(birthdayImageView, birthdayLabel, signInLabel, emailLabel, passwordLabel)
    }
}
