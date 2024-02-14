// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let categoryQuantity = 2
        static let categoryImageRatio: CGFloat = 120.0 / 160.0
        enum Text {
            static let title = "Каталог"
            static let newItems = "Новинки"
            static let sale = "Распродажа"
        }

        enum Fonts {
            static let verdanaBold14 = UIFont.makeVerdanaBold14()
        }

        enum ImageName {
            static let newItemsWoman = "newItemsWoman"
            static let saleWoman = "saleWoman"
            static let newItemsMan = "newItemsMan"
            static let saleMan = "salesMan"
            static let newItemsChild = "newItemsChild"
            static let saleChild = "saleChild"
        }

        enum BuyerType: String, CaseIterable {
            case woman = "Женщинам"
            case man = "Мужчинам"
            case child = "Детям"
        }

        enum Size {
            static let generalInset: CGFloat = 20
            static let topInset: CGFloat = 25
            static var segmentedControlHeight: CGFloat = 44
        }
    }

    // MARK: - Visual Components

    private lazy var buyerTypeSegmentedControl: UISegmentedControl = {
        let types = Array(Constants.BuyerType.allCases).map(\.rawValue)
        let view = UISegmentedControl(items: types)
        view.selectedSegmentIndex = 0
        return view
    }()

    private lazy var newItemsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageName.newItemsWoman)
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var salesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageName.saleWoman)
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var newItemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.Text.newItems
        label.textAlignment = .center
        label.font = Constants.Fonts.verdanaBold14
        label.sizeToFit()
        return label
    }()

    private lazy var salesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.Text.sale
        label.textAlignment = .center
        label.font = Constants.Fonts.verdanaBold14
        label.sizeToFit()
        return label
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        title = Constants.Text.title
        view.addSubviews(buyerTypeSegmentedControl, newItemsImageView, newItemLabel, salesImageView, salesLabel)
        view.disableTARMIC()
    }
}

// Set constraints
private extension CatalogViewController {
    func setConstraints() {
        let inset = Constants.Size.generalInset
        NSLayoutConstraint.activate([
            buyerTypeSegmentedControl.heightAnchor.constraint(equalToConstant: Constants.Size.segmentedControlHeight),
            buyerTypeSegmentedControl.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Size.topInset
            ),
            buyerTypeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            buyerTypeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),

            newItemsImageView.topAnchor.constraint(equalTo: buyerTypeSegmentedControl.bottomAnchor, constant: inset),
            newItemsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            newItemsImageView.heightAnchor.constraint(
                equalTo: newItemsImageView.widthAnchor,
                multiplier: Constants.categoryImageRatio
            ),

            salesImageView.topAnchor.constraint(equalTo: newItemsImageView.topAnchor),
            salesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            salesImageView.leadingAnchor.constraint(equalTo: newItemsImageView.trailingAnchor, constant: inset),
            salesImageView.heightAnchor.constraint(equalTo: newItemsImageView.heightAnchor),

            newItemLabel.topAnchor.constraint(equalTo: newItemsImageView.topAnchor),
            newItemLabel.centerXAnchor.constraint(equalTo: newItemsImageView.centerXAnchor),

            salesLabel.bottomAnchor.constraint(equalTo: salesImageView.bottomAnchor),
            salesLabel.centerXAnchor.constraint(equalTo: salesImageView.centerXAnchor),

        ])
    }
}
