// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Authorisation screen
class LoginViewController: UIViewController {
    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        setLoginButtonAppearance()
        clearTextFields()
    }

    // MARK: - Private Methods

    private func setViews() {
        loginButton.layer.cornerRadius = 12
        loginButton.setTitleColor(.white, for: .disabled)
        loginButton.alpha = 0.5
        loginButton.isEnabled = false
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }

    private func setLoginButtonAppearance() {
        loginButton.setTitleColor(.white, for: .disabled)
        loginButton.alpha = 0.5
        loginButton.isEnabled = false
    }

    private func clearTextFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func loginButtonAction(_ sender: UIButton) {}
}

extension LoginViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if (loginTextField.text?.count ?? 0) > 0, (passwordTextField.text?.count ?? 0) > 0 {
            loginButton.isEnabled = true
            loginButton.alpha = 1
        } else if (loginTextField.text ?? "") == "" || (passwordTextField.text ?? "") == "" {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
        return true
    }
}
