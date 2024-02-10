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
        let button = UIButton(frame: CGRect(x: 20, y: 750, width: UIScreen.main.bounds.width - 40, height: 44))
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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setAppearance()
    }

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .systemBackground
        emailTextField.delegate = self
        passwordTextField.delegate = self
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

    private func setAppearance() {
        emailTextField.text = ""
        passwordTextField.text = ""
        disableViews()
        emailLabel.becomeFirstResponder()
    }

    private func enableViews() {
        loginButton.isEnabled = true
        loginButton.alpha = 1
        faceIDLabel.isHidden = false
        faceIDSwitch.isHidden = false
    }

    private func disableViews() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        faceIDLabel.isHidden = true
        faceIDSwitch.isHidden = true
    }

    @objc private func moveToBirthdayVC() {
        let birthdayVC = BirthdayListViewController()
        navigationController?.pushViewController(birthdayVC, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    // Check password length and email length and show/hide corresponding UI
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let additionalValue = (string.isEmpty) ? -1 : 1
        var emailLength = emailTextField.text?.count ?? 0
        var passwordLength = passwordTextField.text?.count ?? 0
        if textField == emailTextField {
            emailLength += additionalValue
        } else {
            passwordLength += additionalValue
        }

        guard emailLength > 0, passwordLength > 0 else {
            disableViews()
            return true
        }
        enableViews()
        return true
    }
}
