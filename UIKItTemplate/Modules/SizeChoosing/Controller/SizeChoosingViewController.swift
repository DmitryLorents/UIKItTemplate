// SizeChoosingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to choose a size
final class SizeChoosingViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset: CGFloat = 77
            static let generalInset: CGFloat = 20
            static let topTitle: CGFloat = 21
            static let leftButton: CGFloat = 15
            static let topButton: CGFloat = 21
            static let buttonSize: CGFloat = 24
        }

        enum Text {
            static let title = "Выберите размер"
            static let font = UIFont.makeVerdanaBold(16)
        }

        enum Image {
            static let close = "close"
        }
    }

    // MARK: - Visual Components

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Text.title
        label.textAlignment = .center
        label.font = Constants.Text.font
        label.sizeToFit()
        return label
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.Image.close), for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Properties

    private let product: Product

    // MARK: - Initializers

    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabels()
        setUI()
        setConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setViewsUnderlined()
    }

    // MARK: - Private Methods

    private func setLabels() {
        var topInset = Constants.Inset.topInset
        let inset = Constants.Inset.generalInset
        for size in ProductStorage.sizes {
            let label = SizeChoosingLabel(shoesSize: size)
            view.addSubview(label)
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topInset),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset)
            ])
            topInset += inset + label.frame.height
        }
    }

    private func setUI() {
        title = Constants.Text.title
        view.backgroundColor = .systemBackground
        view.addSubviews(titleLabel, closeButton)
        view.disableTARMIC()
        setGestureRecognizerForSubviews()
    }

    private func setViewsUnderlined() {
        view.subviews.forEach {
            guard let sizeLabel = $0 as? SizeChoosingLabel else { return }
            sizeLabel.underlined()
        }
    }

    private func setGestureRecognizerForSubviews() {
        for subview in view.subviews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setSize(sender:)))
            subview.addGestureRecognizer(tapGesture)
            subview.isUserInteractionEnabled = true
        }
    }

    @objc private func setSize(sender: UITapGestureRecognizer) {
        guard let label = sender.view as? SizeChoosingLabel else { return }
        product.size = label.size
        dismiss(animated: true)
    }

    @objc private func close() {
        dismiss(animated: true)
    }
}

// MARK: - Constraints

extension SizeChoosingViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Inset.topTitle),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Inset.topButton),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.Inset.leftButton),
            closeButton.heightAnchor.constraint(equalToConstant: Constants.Inset.buttonSize),
            closeButton.widthAnchor.constraint(equalToConstant: Constants.Inset.buttonSize)
        ])
    }
}
