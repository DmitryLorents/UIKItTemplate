// ProductDetailedView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class ProductDetailedView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let imageEdgeInset: CGFloat = 28
        static let generalInset: CGFloat = 12
        static let labelRightInset: CGFloat = 9
        static let currency = " ₽"
        enum Image {
            static let basketGray = "basketGray"
            static let basketTinted = "basketTinted"
        }
    }

    // MARK: - Visual Components

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "\(price)\(Constants.currency)"
        label.textAlignment = .right
        label.font = UIFont.makeVerdanaBold10()
        label.sizeToFit()
        return label
    }()

    private lazy var productImageView: UIImageView = {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    private lazy var basketImageView: UIImageView = {
        let imageName = Constants.Image.basketGray
        let imageView = UIImageView(image: UIImage(named: imageName))
        return imageView
    }()

    // MARK: - Private Properties

    private let price: Int
    private let imageName: String

    // MARK: - Initializers

    init(price: Int, imageName: String) {
        self.price = price
        self.imageName = imageName
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
