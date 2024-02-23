// TtileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show title text and buttons in UserProfileViewController
final class TtileView: UIView {

    // MARK: - Constants

    private enum Constants {
        static let lockImage = "lock"
        static let plusImage = "moreLines"
        static let moreImage = "plusSquare"
        static let title = "mary_rmLink"
    }
    
    // MARK: - Visual Components

    private let lockImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.lockImage)
        return imageView
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: Constants.plusImage)
        button.setImage(image, for: .normal)
        return button
    }()

    private let moreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: Constants.moreImage)
        button.setImage(image, for: .normal)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addSubviews(lockImageView, titleLabel,plusButton, moreButton)
        setupConstraints()
    }
}

// MARK: - Constraints

private extension TtileView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        lockImageView.heightAnchor.constraint(equalToConstant: 24),
        lockImageView.widthAnchor.constraint(equalTo: lockImageView.heightAnchor),
        lockImageView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
        lockImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
        
        titleLabel.leadingAnchor.constraint(equalTo: lockImageView.leadingAnchor, constant: 6),
        titleLabel.bottomAnchor.constraint(equalTo: lockImageView.bottomAnchor),
        
        moreButton.heightAnchor.constraint(equalTo: lockImageView.heightAnchor),
        moreButton.widthAnchor.constraint(equalTo: lockImageView.widthAnchor),
        moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
        moreButton.bottomAnchor.constraint(equalTo: lockImageView.bottomAnchor),
        
        plusButton.heightAnchor.constraint(equalTo: lockImageView.heightAnchor),
        plusButton.widthAnchor.constraint(equalTo: lockImageView.widthAnchor),
        plusButton.trailingAnchor.constraint(equalTo: moreButton.trailingAnchor, constant: -3),
        plusButton.bottomAnchor.constraint(equalTo: lockImageView.bottomAnchor),
        
        ])
    }
    
}
