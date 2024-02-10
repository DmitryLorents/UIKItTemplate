// PersonDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen with person detailed information
class PersonDetailsViewController: UIViewController {
    // MARK: - Constants

    let leftInset: CGFloat = 20

    // MARK: - Private Properties

    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 20, y: 15)
        return button
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 344, y: 15)
        return button
    }()

    private lazy var personImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 66, width: 125, height: 125))
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "personPhoto")
        return imageView
    }()

    private lazy var changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame.origin.y = 200
        button.setTitle("Change photo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.sizeToFit()
        button.center.x = view.center.x
        return button
    }()

    private lazy var nameLabel: UILabel = .createBlackVerdana16Label(
        text: "Name Surname",
        origin: CGPoint(x: leftInset, y: 239)
    )
    private lazy var nameTextField: UITextField = .createCustomTextField(
        placeholder: "Typing Name Surname",
        yPosition: 268
    )
    private lazy var birthdayLabel: UILabel = .createBlackVerdana16Label(
        text: "Birthday",
        origin: CGPoint(x: leftInset, y: 314)
    )
    private lazy var birthdayTextField: UITextField = .createCustomTextField(
        placeholder: "Typing Date of Birth",
        yPosition: 343
    )
    private lazy var ageLabel: UILabel = .createBlackVerdana16Label(
        text: "Age",
        origin: CGPoint(x: leftInset, y: 389)
    )
    private lazy var ageTextField: UITextField = .createCustomTextField(placeholder: "Typing age", yPosition: 418)
    private lazy var genderLabel: UILabel = .createBlackVerdana16Label(
        text: "Gender",
        origin: CGPoint(x: leftInset, y: 462)
    )
    private lazy var genderTextField: UITextField = .createCustomTextField(
        placeholder: "Indicate gender",
        yPosition: 491
    )
    private lazy var telegramLabel: UILabel = .createBlackVerdana16Label(
        text: "Telegram",
        origin: CGPoint(x: leftInset, y: 537)
    )
    private lazy var telegramTextField: UITextField = .createCustomTextField(
        placeholder: "Typing telegram",
        yPosition: 566
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubViews(
            cancelButton,
            addButton,
            personImageView,
            changePhotoButton,
            nameLabel,
            nameTextField,
            birthdayLabel,
            birthdayTextField,
            ageLabel,
            ageTextField,
            genderLabel,
            genderTextField,
            telegramLabel,
            telegramTextField
        )
    }
}
