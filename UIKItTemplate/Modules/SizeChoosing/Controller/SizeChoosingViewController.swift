// SizeChoosingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to choose a size
final class SizeChoosingViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset: CGFloat = 33
            static let generalInset: CGFloat = 20
        }

        enum Text {
            static let title = "Выберите размер"
        }
    }

    // MARK: - Visual Components

    // MARK: - Public Properties

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
        setAppearance()
        setUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setViewsUnderlined()
    }

    // MARK: - Private Methods

    private func setAppearance() {
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
        view.disableTARMIC()
        setGestureRecognizerForSubviews()
    }

    private func setViewsUnderlined() {
        view.subviews.forEach { $0.underlined() }
    }

    private func setGestureRecognizerForSubviews() {
        for subview in view.subviews {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setSize(sender:)))
            subview.addGestureRecognizer(tapGesture)
            subview.isUserInteractionEnabled = true
        }
    }

    @objc private func setSize(sender: UITapGestureRecognizer) {
        print(#function)
        guard let label = sender.view as? SizeChoosingLabel else { return }
        product.size = label.size
        print("New size: \(product.size)")
        dismiss(animated: true)
    }
}
