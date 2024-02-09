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
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 671, width: UIScreen.main.bounds.width - 40, height: 44))
        button.backgroundColor = UIColor(named: "customRedColor")
        button.layer.cornerRadius = 12
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-bold", size: 16)
        button.addTarget(nil, action: #selector(moveToBirthdayVC), for: .touchUpInside)
        button.isEnabled = false
        button.alpha = 0.5
        return button
    }()

    private let emailTextField: UITextField = .createCustomTextField(placeholder: "Typing email", yPosition: 347)
    private let passwordTextField: UITextField = .createCustomTextField(placeholder: "Typing password", yPosition: 422)
    private lazy var faceIDLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 86, y: 544, width: 0, height: 0))
        label.text = "Use FaceID"
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.sizeToFit()
        return label
    }()

    private lazy var secureImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 352, y: 423, width: 22, height: 19))
        imageView.image = UIImage(systemName: "eye.slash")
        imageView.tintColor = .gray
        return imageView
    }()

    private let faceIDSwitch = UISwitch(frame: CGRect(x: 238, y: 536, width: 0, height: 0))

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubViews(
            birthdayImageView,
            birthdayLabel,
            signInLabel,
            emailLabel,
            passwordLabel,
            loginButton,
            emailTextField,
            passwordTextField,
            faceIDLabel,
            faceIDSwitch,
            secureImageView
        )
    }

    @objc private func moveToBirthdayVC() {
        let birthdayVC = BirthdayViewController()
        navigationController?.pushViewController(birthdayVC, animated: true)
    }
}
