// ProductDetailedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen with detailed information for зкщвгсеы
final class ProductDetailedViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset: CGFloat = 33
            static let generalInset: CGFloat = 20
        }

        enum Text {
            static let title = "Обувь"
        }

        enum ImageName {
            static let shoes1 = "shoes#1"
            static let shoes2 = "shoes#2"
            static let shoes3 = "shoes#3"
            static let shoes4 = "shoes#4"
            static let shoes5 = "shoes#5"
        }
    }

    // MARK: - Visual Components

    private lazy var productView1 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
    private lazy var productView2 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
    private lazy var productView3 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
    private lazy var productView4 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)
    private lazy var productView5 = ProductDetailedView(price: 2250, imageName: Constants.ImageName.shoes1)

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }

    // MARK: - Private Methods

    private func setUI() {
        title = Constants.Text.title
        view.addSubviews(
            productView1, productView2, productView3, productView4, productView5
        )
        view.disableTARMIC()
    }
}

// Set constraints
private extension ProductDetailedViewController {
    func setConstraints() {
        let inset = Constants.Inset.generalInset
        NSLayoutConstraint.activate([
            productView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            productView1.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Inset.topInset
            ),
            productView1.heightAnchor.constraint(equalTo: productView1.widthAnchor, multiplier: 1),

            productView2.topAnchor.constraint(equalTo: productView1.topAnchor),
            productView2.heightAnchor.constraint(equalTo: productView2.widthAnchor, multiplier: 1),
            productView2.heightAnchor.constraint(equalTo: productView1.heightAnchor, multiplier: 1),
            productView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            productView2.leadingAnchor.constraint(equalTo: productView1.trailingAnchor, constant: inset),

            productView3.topAnchor.constraint(equalTo: productView1.bottomAnchor, constant: inset),
            productView3.heightAnchor.constraint(equalTo: productView3.widthAnchor, multiplier: 1),
            productView3.heightAnchor.constraint(equalTo: productView1.heightAnchor, multiplier: 1),
            productView3.leadingAnchor.constraint(equalTo: productView1.leadingAnchor),

            productView4.topAnchor.constraint(equalTo: productView3.topAnchor),
            productView4.heightAnchor.constraint(equalTo: productView4.widthAnchor, multiplier: 1),
            productView4.heightAnchor.constraint(equalTo: productView1.heightAnchor, multiplier: 1),
            productView4.trailingAnchor.constraint(equalTo: productView2.trailingAnchor),
            productView4.leadingAnchor.constraint(equalTo: productView1.trailingAnchor, constant: inset),

            productView5.topAnchor.constraint(equalTo: productView3.bottomAnchor, constant: inset),
            productView5.heightAnchor.constraint(equalTo: productView5.widthAnchor, multiplier: 1),
            productView5.heightAnchor.constraint(equalTo: productView1.heightAnchor, multiplier: 1),
            productView5.leadingAnchor.constraint(equalTo: productView1.leadingAnchor)

        ])
    }
}
