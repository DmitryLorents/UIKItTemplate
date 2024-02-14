// PersonDetailsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen with person detailed information
final class PersonDetailsViewController: UIViewController {
    // MARK: - Constants

    private let leftInset: CGFloat = 20
    private let model = PersonDetailsModel()

    // MARK: - Private Properties

    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 20, y: 15)
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        return button
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame.origin = CGPoint(x: 344, y: 15)
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
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
    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let okButton = UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(hideToolbar))
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        toolbar.setItems([flexibleSpace, okButton], animated: true)
        return toolbar
    }()

    private lazy var toolbarForDate: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(formatDate))
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        return toolbar
    }()

    private lazy var agePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private lazy var genderPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private lazy var datePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTextFieldsInputViews()
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

    private func setTextFieldsInputViews() {
        telegramTextField.addTarget(self, action: #selector(telegramTFAction), for: .touchDown)
        ageTextField.inputAccessoryView = toolbar
        ageTextField.inputView = agePickerView
        genderTextField.inputAccessoryView = toolbar
        genderTextField.inputView = genderPickerView
        birthdayTextField.inputAccessoryView = toolbarForDate
        birthdayTextField.inputView = datePickerView
    }

    @objc private func hideToolbar() {
        view.endEditing(true)
    }

    @objc private func formatDate() {
        print(datePickerView.date)
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        birthdayTextField.text = formatter.string(from: datePickerView.date)
        view.endEditing(true)
    }

    @objc func closeScreen() {
        dismiss(animated: true)
    }

    @objc private func telegramTFAction() {
        print(#function)
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let text = alert.textFields?.first?.text ?? ""
            self.telegramTextField.text = text
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UIPickerViewDataSource

extension PersonDetailsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case agePickerView:
            return model.ageStorage.count
        case genderPickerView:
            return model.genders.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case agePickerView:
            return String(model.ageStorage[row])
        case genderPickerView:
            return model.genders[row]
        default:
            return nil
        }
    }
}

// MARK: - UIPickerViewDataSource

extension PersonDetailsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case agePickerView:
            ageTextField.text = String(model.ageStorage[row])
        case genderPickerView:
            genderTextField.text = model.genders[row]
        default:
            break
        }
    }
}
