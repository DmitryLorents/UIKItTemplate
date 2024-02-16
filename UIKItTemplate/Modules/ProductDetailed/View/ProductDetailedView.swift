// ProductDetailedView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ProductDetailedViewDelegate: AnyObject {
    func chooseSizeFor(product: Product)
}

/// View to show product with price
final class ProductDetailedView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let imageEdgeInset: CGFloat = 28
        static let generalInset: CGFloat = 12
        static let labelRightInset: CGFloat = 9
        static let currency = " ₽"
        static let font = UIFont.makeVerdanaBold(10)
        enum Image {
            static let basketGray = "basketGray"
            static let basketTinted = "basketTinted"
        }
    }

    // MARK: - Visual Components

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "\(product.price)\(Constants.currency)"
        label.textAlignment = .right
        label.font = Constants.font
        label.sizeToFit()
        label.isHidden = isPriceHidden
        return label
    }()

    private lazy var productImageView: UIImageView = {
        let image = UIImage(named: product.imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var basketImageView: UIImageView = {
        let imageName = product.isAddedToBasket ? Constants.Image.basketTinted : Constants.Image.basketGray
        let imageView = UIImageView(image: UIImage(named: imageName))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(getSize))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    // MARK: - Public Properties

    weak var delegate: ProductDetailedViewDelegate?

    // MARK: - Private Properties

    private let product: Product
    private let isPriceHidden: Bool

    // MARK: - Initializers

    init(product: Product, isPreceHidden: Bool) {
        self.product = product
        isPriceHidden = isPreceHidden
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

private extension ProductDetailedView {
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
