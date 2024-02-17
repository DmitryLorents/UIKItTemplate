// ProfileDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ProfileDetailsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let maxNumberCount = 11
        enum Insets {
            static let left = CGFloat(20)
            static let height = CGFloat(44)
        }
    }

    private let sizes = [Int](1 ... 100)

    // MARK: - Visual Components

    private let myDataLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textColorBlack")
        label.text = "Мои данные"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let nameTextField = InfoTextField(
        placeholderText: "Имя", typeOfKeyboard: .default
    )
    private let lastNameTextField = InfoTextField(
        placeholderText: "Фамилия", typeOfKeyboard: .default
    )
    private let phoneNumberTextField = InfoTextField(
        placeholderText: "Номер телефона", typeOfKeyboard: .numberPad
    )
    private let footSizeTextField = InfoTextField(
        placeholderText: "Размер ноги", typeOfKeyboard: .numberPad
    )
    private let birthDayTextField = InfoTextField(
        placeholderText: "Дата Рождения", typeOfKeyboard: .default
    )
    private let emailTextField = InfoTextField(
        placeholderText: "Почта", typeOfKeyboard: .emailAddress
    )

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

    private let pickerView = UIPickerView()
    private let datePicker = UIDatePicker()
    private let toolbar = UIToolbar()

    // MARK: - Private Properties

    private lazy var infoTextFields = [
        nameTextField,
        lastNameTextField,
        phoneNumberTextField,
        footSizeTextField,
        birthDayTextField,
        emailTextField
    ]

    private var regax: NSRegularExpression?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()

        setupSubviews()
        configureSubviews()
        setupRegax()
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
        setupKeyboardHidingTapGesture()
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

    private func updateTextFieldWithData(
        from textFieldsMap: [String: String]
    ) {
        for infoTextField in infoTextFields {
            guard let placeholderText = infoTextField.placeholder else { return }
            infoTextField.text = textFieldsMap[placeholderText]
        }
    }

    private func setupTextFieldDelegate(
        for textFields: [UITextField]
    ) {
        for textField in textFields {
            textField.delegate = self
        }
    }

    private func setupRegax() {
        do {
            let regex = try NSRegularExpression(
                pattern: "[\\+\\s-\\(\\)]",
                options: .caseInsensitive
            )
            regax = regex
        } catch {
            print("Ошибка при создании NSRegularExpression: \(error)")
        }
    }

    private func setupKeyboardHidingTapGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self, action: #selector(hideKeyboard)
        )
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func didTapSaveButton(_ sender: UIButton) {
        print(PersonalData.personalInfoMap)
        for infoTextField in infoTextFields {
            guard let newText = infoTextField.text,
                  let placeholderText = infoTextField.placeholder
            else { return }
            PersonalData.personalInfoMap[placeholderText] = newText
            view.endEditing(true)
            saveButton.isHidden = true
        }
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Extensions

/// Расширение для форматирования номера телефона
extension ProfileDetailsViewController {
    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else {
            return ""
        }

        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        guard let regax = regax else { return "" }
        var number = regax.stringByReplacingMatches(
            in: phoneNumber, options: [],
            range: range, withTemplate: ""
        )

        if number.count > Constants.maxNumberCount {
            let maxIndex = number.index(
                number.startIndex, offsetBy: Constants.maxNumberCount
            )
            number = String(number[number.startIndex ..< maxIndex])
        }

        if shouldRemoveLastDigit {
            let maxIndex = number.index(
                number.startIndex, offsetBy: number.count - 1
            )
            number = String(number[number.startIndex ..< maxIndex])
        }

        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex ..< maxIndex

        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern, with: "$1 ($2) $3",
                options: .regularExpression, range: regRange
            )
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern, with: "$1 ($2) $3-$4-$5",
                options: .regularExpression, range: regRange
            )
        }

        return "+" + number
    }
}

/// Расширение для показа кнопки "Сохронить" при редактировании данных:
extension ProfileDetailsViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isHidden = false
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if textField == phoneNumberTextField {
            let fullString = (textField.text ?? "") + string
            textField.text = format(
                phoneNumber: fullString,
                shouldRemoveLastDigit: range.length == 1
            )
            return false
        }
        return true
    }
}

/// Расширение для показа календаря для выбора даты рождения

extension ProfileDetailsViewController {
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.backgroundColor = .datePickerBackground
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        birthDayTextField.delegate = self
        birthDayTextField.inputView = datePicker
    }

    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM.yyyy"
        birthDayTextField.text = dateFormatter.string(from: datePicker.date)
        birthDayTextField.resignFirstResponder()
    }
}
