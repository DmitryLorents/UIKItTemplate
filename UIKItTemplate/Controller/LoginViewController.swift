// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class LoginViewController: UIViewController {
    // MARK: - Constants

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
    
    private lazy var signInLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 266, width: 0, height: 0))
        label.text = "Birthday\nReminder"
        label.numberOfLines = 0
        label.textColor = UIColor(named: "customRedColor")
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-bold", size: 18)
        label.sizeToFit()
        label.center.x = view.center.x
        return label
    }()

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
        view.backgroundColor = .systemBackground
        view.addSubview(birthdayImageView)
        view.addSubview(birthdayLabel)
    }
}
