// CardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для скидочной карты пользователя
final class CardView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let logoImage = "logo_card"
        static let infoImage = "info"
        static let qrImage = "qr"
    }

    // MARK: - Visual Components

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.logoImage)
        return imageView
    }()

    private let qrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.qrImage)
        return imageView
    }()

    private let infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.infoImage)
        return imageView
    }()

    private let discountLabel: UILabel = {
        let label = UILabel()
        label.text = "15%"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: "textColorWhite")
        return label
    }()

    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 0001 0102"
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor(named: "textColorWhite")
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupSubview()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubview() {
        addSubViews(
            logoImageView,
            qrImageView,
            infoImageView,
            discountLabel,
            cardNumberLabel
        )
    }

    private func configureSubviews() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        infoImageView.translatesAutoresizingMaskIntoConstraints = false
        qrImageView.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        cardNumberLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),

            qrImageView.widthAnchor.constraint(equalToConstant: 30),
            qrImageView.heightAnchor.constraint(equalToConstant: 30),
            qrImageView.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            qrImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 291),

            infoImageView.widthAnchor.constraint(equalToConstant: 30),
            infoImageView.heightAnchor.constraint(equalToConstant: 30),
            infoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            infoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 291),

            discountLabel.widthAnchor.constraint(equalToConstant: 44),
            discountLabel.heightAnchor.constraint(equalToConstant: 19),
            discountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 116),
            discountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),

            cardNumberLabel.widthAnchor.constraint(equalToConstant: 118),
            cardNumberLabel.heightAnchor.constraint(equalToConstant: 17),
            cardNumberLabel.topAnchor.constraint(equalTo: topAnchor, constant: 142),
            cardNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
        ])

        backgroundColor = .black
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
}
