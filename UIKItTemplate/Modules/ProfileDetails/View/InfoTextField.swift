// InfoTextField.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Шаблон переиспользуемой ячейки ( textField ) для ввода личных данных
final class InfoTextField: UITextField {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let leading = CGFloat(20)
            static let trailing = CGFloat(-20)
            static let height = CGFloat(44)
        }
    }

    // MARK: - Private properties

    private var placeholderText: String = ""
    private var typeOfKeyboard: UIKeyboardType = .default

    // MARK: - Initializers

    init(placeholderText: String, typeOfKeyboard: UIKeyboardType) {
        super.init(frame: .zero)
        self.placeholderText = placeholderText
        self.typeOfKeyboard = typeOfKeyboard
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Private Methods

    private func commonInit() {
        setupTextField()
        setupPadding()
    }

    private func setupTextField() {
        placeholder = placeholderText
        backgroundColor = .textFieldBackground
        textColor = UIColor.textFieldForeground
        font = .systemFont(ofSize: 16, weight: .bold)
        layer.cornerRadius = 12
        keyboardType = typeOfKeyboard
    }

    private func setupPadding() {
        let paddingView = UIView()
        addSubview(paddingView)

        paddingView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        paddingView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        paddingView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        paddingView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true

        leftView = paddingView
        leftViewMode = .always
    }
}
