// TitleView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show title text and buttons in UserProfileViewController
final class TitleView: UIView {
    // MARK: - Constants

        static let title = "mary_rmLink"

    // MARK: - Visual Components

    private let lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .lock
        return imageView
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(.plusSquare, for: .normal)
        return button
    }()

    private let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(.moreLines, for: .normal)
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.title
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold(18)
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubviews(lockImageView, titleLabel, plusButton, moreButton)
        disableTARMIC()
        setupConstraints()
    }
}

// MARK: - Constraints

private extension TitleView {
    func setupConstraints() {
        setupLockImageViewConstraints()
        setupTitleLabelConstraints()
        setupMoreButtonConstraints()
        setupPlusButtonConstraints()
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

    func setupLockImageViewConstraints() {
        NSLayoutConstraint.activate([
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lockImageView.heightAnchor.constraint(equalToConstant: 24),
            lockImageView.widthAnchor.constraint(equalTo: lockImageView.heightAnchor),
            lockImageView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            lockImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: lockImageView.trailingAnchor, constant: 6),
            titleLabel.bottomAnchor.constraint(equalTo: lockImageView.bottomAnchor)
        ])
    }

    func setupMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            moreButton.heightAnchor.constraint(equalTo: lockImageView.heightAnchor),
            moreButton.widthAnchor.constraint(equalTo: lockImageView.widthAnchor),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreButton.bottomAnchor.constraint(equalTo: lockImageView.bottomAnchor)
        ])
    }

    func setupPlusButtonConstraints() {
        NSLayoutConstraint.activate([
            plusButton.heightAnchor.constraint(equalTo: lockImageView.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: lockImageView.widthAnchor),
            plusButton.trailingAnchor.constraint(equalTo: moreButton.leadingAnchor, constant: -3),
            plusButton.bottomAnchor.constraint(equalTo: lockImageView.bottomAnchor)
        ])
    }
}
