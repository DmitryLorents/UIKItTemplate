// ProfileDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ProfileDetailsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let left = CGFloat(20)
            static let height = CGFloat(44)
        }
    }

    // MARK: - Visual Components

    private let myDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textColorBlack")
        label.text = "Мои данные"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let nameTextField = InfoTextField(placeholderText: "Имя")
    private let lastNameTextField = InfoTextField(placeholderText: "Фамилия")
    private let phoneNumberTextField = InfoTextField(placeholderText: "Номер телефона")
    private let footSizeTextField = InfoTextField(placeholderText: "Размер ноги")
    private let birthDayTextField = InfoTextField(placeholderText: "Дата Рождения")
    private let emailTextField = InfoTextField(placeholderText: "Почта")

    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = .saveButtonBackground
        button.setTitleColor(.textColorWhite, for: .normal)
        button.layer.cornerRadius = 12
        button.isHidden = true
        button.addTarget(
            self,
            action: #selector(didTapSaveButton(_:)),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Private Properties

    private lazy var infoTextFields = [
        nameTextField,
        lastNameTextField,
        phoneNumberTextField,
        footSizeTextField,
        birthDayTextField,
        emailTextField
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
        setupTextFieldDelegate(for: infoTextFields)
        updateTextFieldWithData(from: PersonalData.personalInfoMap)
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubViews(
            myDataLabel,
            nameTextField,
            lastNameTextField,
            phoneNumberTextField,
            footSizeTextField,
            birthDayTextField,
            emailTextField,
            saveButton
        )
        view.disableTARMIC()
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            myDataLabel.widthAnchor.constraint(equalToConstant: 115),
            myDataLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            ),
            myDataLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            myDataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            saveButton.widthAnchor.constraint(equalToConstant: 335),
            saveButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.height
            ),
            saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 654),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        configureTextFields()
    }

    private func configureTextFields() {
        for (index, infoTextField) in infoTextFields.enumerated() {
            let topInset = CGFloat(113 + (index * 54))
            infoTextField.topAnchor.constraint(
                equalTo: view.topAnchor, constant: topInset
            ).isActive = true
            infoTextField.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ).isActive = true
        }
    }

    private func updateTextFieldWithData(from textFieldsMap: [String: String]) {
        for infoTextField in infoTextFields {
            guard let placeholderText = infoTextField.placeholder else { return }
            infoTextField.text = textFieldsMap[placeholderText]
        }
    }

    private func setupTextFieldDelegate(for textFields: [UITextField]) {
        for textField in textFields {
            textField.delegate = self
        }
    }

    @objc private func didTapSaveButton(_ sender: UIButton) {
        print(PersonalData.personalInfoMap)
        for infoTextField in infoTextFields {
            guard let newText = infoTextField.text,
                  let placeholderText = infoTextField.placeholder
            else { return }
            PersonalData.personalInfoMap[placeholderText] = newText
        }
    }
}

extension ProfileDetailsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isUserInteractionEnabled = true
        saveButton.isHidden = false
    }
}
