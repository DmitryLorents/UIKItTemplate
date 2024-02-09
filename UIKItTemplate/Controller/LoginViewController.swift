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

    // MARK: - Private Methods

    private func setViews() {
        loginButton.layer.cornerRadius = 12
    }

    @IBAction func loginButtonAction(_ sender: UIButton) {}
}
