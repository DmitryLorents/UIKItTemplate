// UserProfileCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show user profile information
final class UserProfileCell: UITableViewCell {
    // MARK: - Constants

    /// Constants of UserProfileCell
    private enum Constants {
        /// Standard inset from left or right side
        static let sideInset: CGFloat = 15
        /// Standard inset per items
        static let interItemInset: CGFloat = 10
        /// Width and height of userImageView
        static let userImageViewSize: CGFloat = 80
        /// Width and height of plusButtonImageView
        static let plusButtonSize: CGFloat = 26
        /// Title for plusButton
        static let plusButtonTitle = "+"
    }

    static let reuseID = String(describing: UserProfileCell.self)

    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constants.userImageViewSize / 2
        return imageView
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .redApp
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(12)
        button.setTitle(Constants.plusButtonTitle, for: .normal)
        button.layer.cornerRadius = Constants.plusButtonSize / 2
        return button
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold(14)
        return label
    }()

    // MARK: - Private Properties

    private var user: User? {
        didSet {
            if let user {
                setupSubviews(user)
            }
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods

    func setupWith(_ user: User) {
        self.user = user
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubviews(userImageView, plusButton, userNameLabel)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func setupSubviews(_ user: User) {
        userImageView.image = UIImage(named: user.image)
        userNameLabel.text = user.name
    }
}

// MARK: - Constraints

private extension UserProfileCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 230),

            userImageView.heightAnchor.constraint(equalToConstant: Constants.userImageViewSize),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideInset),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),

            plusButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            plusButton.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.plusButtonSize),
            plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor),

            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: Constants.interItemInset),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),

        ])
    }
}
