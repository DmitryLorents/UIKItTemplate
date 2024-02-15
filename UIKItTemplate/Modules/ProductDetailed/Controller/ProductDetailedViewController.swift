// ProductDetailedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen with detailed information for зкщвгсеы
final class ProductDetailedViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset = 33
            static let generalInset: CGFloat = 20
        }

        enum Text {
            static let title = "Обувь"
        }

        enum ImageName {
            static let basketBuy = "basketBuy"
            static let shoes1 = "shoes#1"
            static let shoes2 = "shoes#2"
            static let shoes3 = "shoes#3"
            static let shoes4 = "shoes#4"
            static let shoes5 = "shoes#5"
        }
    }

    // MARK: - Visual Components

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
        )
        view.disableTARMIC()
    }
}

// Set constraints
private extension ProductDetailedViewController {
    func setConstraints() {
//        let inset = Constants.Inset.generalInset
        NSLayoutConstraint.activate([
            //            buyerTypeSegmentedControl.heightAnchor.constraint(equalToConstant: Constants.Size.segmentedControlHeight),
//            buyerTypeSegmentedControl.topAnchor.constraint(
//                equalTo: view.safeAreaLayoutGuide.topAnchor,
//                constant: Constants.Size.topInset
//            ),
//            buyerTypeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
//            buyerTypeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
//
//            newItemsImageView.topAnchor.constraint(equalTo: buyerTypeSegmentedControl.bottomAnchor, constant: inset),
//            newItemsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
//            newItemsImageView.heightAnchor.constraint(
//                equalTo: newItemsImageView.widthAnchor,
//                multiplier: Constants.categoryImageRatio
//            ),
//
//            salesImageView.topAnchor.constraint(equalTo: newItemsImageView.topAnchor),
//            salesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
//            salesImageView.leadingAnchor.constraint(equalTo: newItemsImageView.trailingAnchor, constant: inset),
//            salesImageView.heightAnchor.constraint(equalTo: newItemsImageView.heightAnchor),
//
//            newItemLabel.topAnchor.constraint(equalTo: newItemsImageView.topAnchor),
//            newItemLabel.centerXAnchor.constraint(equalTo: newItemsImageView.centerXAnchor),
//
//            salesLabel.bottomAnchor.constraint(equalTo: salesImageView.bottomAnchor),
//            salesLabel.centerXAnchor.constraint(equalTo: salesImageView.centerXAnchor),
//
//            brandView.topAnchor.constraint(equalTo: newItemsImageView.bottomAnchor, constant: inset),
//            brandView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
//            brandView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
//            brandView.heightAnchor.constraint(equalToConstant: Constants.categoryViewHeight),
//
//            shoesView.topAnchor.constraint(equalTo: brandView.bottomAnchor, constant: inset),
//            shoesView.leadingAnchor.constraint(equalTo: brandView.leadingAnchor),
//            shoesView.trailingAnchor.constraint(equalTo: brandView.trailingAnchor),
//            shoesView.heightAnchor.constraint(equalTo: brandView.heightAnchor),
//
//            bagView.topAnchor.constraint(equalTo: shoesView.bottomAnchor, constant: inset),
//            bagView.leadingAnchor.constraint(equalTo: brandView.leadingAnchor),
//            bagView.trailingAnchor.constraint(equalTo: brandView.trailingAnchor),
//            bagView.heightAnchor.constraint(equalTo: brandView.heightAnchor)

        ])
    }
}
