// BasketView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// protocol ProductDetailedViewDelegate: AnyObject {
//    func chooseSizeFor(product: Product)
// }

/// View to show product with price
final class BasketView: UIView {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let buttonSideInset: CGFloat = 4
            static let generalInset: CGFloat = 12
        }

        enum Image {
            static let basketGray = "basketGray"
            static let basketTinted = "basketTinted"
        }

        enum Text {
            static let quantity = "Количество"
            static let size = "Размер"
            static let price = "Цена"
            static let currency = " ₽"
        }

        enum Font {
            static let verdana12 = UIFont.makeVerdanaRegular(12)
            static let verdana10 = UIFont.makeVerdanaRegular(10)
            static let verdanaBold10 = UIFont.makeVerdanaBold(10)
        }
    }

    // MARK: - Visual Components

    private lazy var nameLabel = UIView.makeBasketViewLabel(text: product.name)
    private lazy var quantityLabe = UIView.makeBasketViewLabel(text: Constants.Text.quantity)
    private lazy var sizeLabel = UIView.makeBasketViewLabel(text: Constants.Text.size)
    private lazy var priceLabel = UIView.makeBasketViewLabel(text: Constants.Text.price)
    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(product.price)\(Constants.Text.currency)"
        label.textAlignment = .right
        label.font = Constants.Font.verdanaBold10
        label.sizeToFit()
        return label
    }()

//    private lazy var size

    // MARK: - Public Properties

    weak var delegate: ProductDetailedViewDelegate?

    // MARK: - Private Properties

    private let product: Product

    // MARK: - Initializers

    init(product: Product) {
        self.product = product
        super.init(frame: .zero)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        backgroundColor = .lightGrayApp
        addSubviews(nameLabel, quantityLabe, sizeLabel, priceLabel, priceValueLabel)
        disableTARMIC()
        setConstraints()
    }
}

// MARK: - Set constraints

private extension BasketView {
    func setConstraints() {
        let inset = Constants.Inset.generalInset
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            priceValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor),

            sizeLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            // TODO: - Set correct constraint
            sizeLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -inset * 3),

            quantityLabe.bottomAnchor.constraint(equalTo: sizeLabel.topAnchor, constant: -inset),
            quantityLabe.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),

            nameLabel.bottomAnchor.constraint(equalTo: quantityLabe.topAnchor, constant: -inset),
            nameLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),

        ])
    }
}
