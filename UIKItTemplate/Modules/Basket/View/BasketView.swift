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
        static let imageEdgeInset: CGFloat = 28
        static let generalInset: CGFloat = 12
        static let labelRightInset: CGFloat = 9

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
        label.text = Constants.Text.price
        label.textAlignment = .right
        label.font = Constants.Font.verdanaBold10
        label.sizeToFit()
        return label
    }()

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
        layer.cornerRadius = 20
        addSubviews(priceLabel, productImageView, basketImageView)
        disableTARMIC()
        setConstraints()
    }

    @objc private func getSize() {
        basketImageView.image = UIImage(named: Constants.Image.basketTinted)
        product.isAddedToBasket = true
        delegate?.chooseSizeFor(product: product)
    }
}

// MARK: - Set constraints

private extension BasketView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.generalInset),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.labelRightInset),

            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.imageEdgeInset),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.imageEdgeInset),
            productImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.imageEdgeInset),
            productImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.imageEdgeInset),

            basketImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.generalInset),
            basketImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.generalInset),
            basketImageView.heightAnchor.constraint(equalToConstant: Constants.generalInset),
            basketImageView.widthAnchor.constraint(equalToConstant: Constants.generalInset)

        ])
    }
}
