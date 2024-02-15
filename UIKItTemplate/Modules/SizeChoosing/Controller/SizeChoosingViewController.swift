// SizeChoosingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to choose a size
final class SizeChoosingViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let sizes = Array(35 ... 39)

        enum Inset {
            static let topInset: CGFloat = 33
            static let generalInset: CGFloat = 20
        }

        enum Text {
            static let title = "Выберите размер"
        }
    }

    // MARK: - Visual Components

//    private lazy var sizeLabel35 = SizeChoosingLabel(shoesSize: Constants.sizes)
//    private lazy var productView2 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
//    private lazy var productView3 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
//    private lazy var productView4 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
//    private lazy var productView5 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

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
        for size in Constants.sizes {
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
    }

    private func setViewsUnderlined() {
        view.subviews.forEach { $0.underlined() }
    }
}
