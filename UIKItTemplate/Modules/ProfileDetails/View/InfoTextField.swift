// InfoTextField.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Шаблон переиспользуемой ячейки ( textField ) для личных данных
final class InfoTextField: UITextField {
    var placeholderText: String?

    // MARK: - Initializers

    init(placeholderText: String?) {
        super.init(frame: .zero)
        self.placeholderText = placeholderText
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Private Methods

    private func commonInit() {
        guard let placeholderText = placeholderText else { return }

        setupTextField()
        setupPadding()
        configureTextField()
    }

    private func setupTextField() {
        placeholder = placeholderText
        backgroundColor = .textFieldBackground
        textColor = UIColor.textFieldForeground
        font = .systemFont(ofSize: 16, weight: .bold)
        layer.cornerRadius = 12
    }

    private func setupPadding() {
        let paddingView = UIView(
            frame: CGRect(
                x: 0, y: 0, width: 18, height: frame.height
            )
        )
        leftView = paddingView
        leftViewMode = .always
    }

    private func configureTextField() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 335),
            heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
