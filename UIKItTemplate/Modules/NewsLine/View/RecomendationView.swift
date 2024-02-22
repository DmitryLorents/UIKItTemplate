// RecomendationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show story
final class RecomendationView: UIView {
    // MARK: - Constants

    /// Constants for RecomendationView
    private enum Constants {
        /// Width and height of imageView
        static let imageViewSize: CGFloat = 115
        /// Height of button
        static let buttonHeight: CGFloat = 30
        /// Height of RecomendationView
        static let viewHeight: CGFloat = 200
        /// Width of RecomendationView
        static let viewWidth: CGFloat = 185
        /// Title for subscribeButton
        static let buttonTitle = "Подписаться"
    }

    // MARK: - Visual Components

    private lazy var userImageView: UIImageView = {
        let image = UIImage(named: recomendation.imageName)
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constants.imageViewSize / 2
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = recomendation.userName
        label.textAlignment = .center
        label.font = .makeVerdanaRegular(10)
        return label
    }()

    private let subscribeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blueApp
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaBold(10)
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private let closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.close, for: .normal)
        return button
    }()

    // MARK: - Private Properties

    private let recomendation: Recomendation

    // MARK: - Initializers

    init(recomendation: Recomendation) {
        self.recomendation = recomendation
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = .white
        addSubviews(
            userImageView,
            nameLabel,
            subscribeButton,
            closeButton
        )
        disableTARMIC()
        setupConstraints()
    }
}

// MARK: - Constraints

private extension RecomendationView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.viewHeight),
            widthAnchor.constraint(equalToConstant: Constants.viewWidth),

            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            userImageView.heightAnchor.constraint(equalToConstant: Constants.imageViewSize),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1),
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),

            subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            subscribeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),

            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -9),
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 9),

        ])
    }
}
