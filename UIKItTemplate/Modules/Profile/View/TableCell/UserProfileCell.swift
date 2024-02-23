// UserProfileCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show user profile information
final class UserProfileCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sideInset: CGFloat = 15
        static let interItemInset: CGFloat = 10
        static let userImageViewSize: CGFloat = 80
        static let plusButtonSize: CGFloat = 26
        static let plusButtonTitle = "+"
        static let urlButtonTitle = "wwww.space.com"
        static let changeButtonTitle = "Изменить"
        static let shareProfileButtonTitle = "Поделиться профилем"
        static let buttonCornerRadius: CGFloat = 8
        static let addUserImageName = "addUser"
        static let postLabelTitle = "публикации"
        static let subscribersLabelTitle = "подписчики"
        static let subscriptionsLabelTitle = "подписки"
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

    private let userPositionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaRegular(14)
        return label
    }()

    private lazy var urlButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.urlButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.makeVerdanaRegular(14)
        button.addTarget(self, action: #selector(urlButtonDidTapped), for: .touchUpInside)
        return button
    }()

    private lazy var changeButton = makeRoundedGrayButton(title: Constants.changeButtonTitle)
    private lazy var shareProfileButton = makeRoundedGrayButton(title: Constants.shareProfileButtonTitle)
    private lazy var addUserButton: UIButton = {
        let button = makeRoundedGrayButton(title: "")
        let image = UIImage(named: Constants.addUserImageName)
        button.setImage(image, for: .normal)
        return button
    }()

    private lazy var postAmountLabel = makeVerdanaBold14Label()
    private lazy var subscribersAmountLabel = makeVerdanaBold14Label()
    private lazy var subscriptionAmountLabel = makeVerdanaBold14Label()
    private lazy var postsLabel = makeVerdanaRegular10Label(title: Constants.postLabelTitle)
    private lazy var subscribersLabel = makeVerdanaRegular10Label(title: Constants.subscribersLabelTitle)
    private lazy var subscriptionsLabel = makeVerdanaRegular10Label(title: Constants.subscriptionsLabelTitle)

    // MARK: - Publuc Properties

    var handler: ((String) -> Void)?

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
        contentView.addSubviews(
            userImageView,
            plusButton,
            userNameLabel,
            userPositionLabel,
            urlButton,
            changeButton,
            shareProfileButton,
            addUserButton,
            postAmountLabel,
            subscribersAmountLabel,
            subscriptionAmountLabel,
            postsLabel,
            subscribersLabel,
            subscriptionsLabel
        )
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func setupSubviews(_ user: User) {
        userImageView.image = UIImage(named: user.image)
        userNameLabel.text = user.name
        userPositionLabel.text = user.position
        postAmountLabel.text = "\(user.postAmount)"
        subscribersAmountLabel.text = "\(user.subscribersAmount)"
        subscriptionAmountLabel.text = "\(user.subsriptionsAmount)"
    }

    private func makeRoundedGrayButton(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightGrayApp
        button.titleLabel?.font = UIFont.makeVerdanaBold(10)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = Constants.buttonCornerRadius
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return button
    }

    private func makeVerdanaBold14Label() -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.makeVerdanaBold(14)
        return label
    }

    private func makeVerdanaRegular10Label(title: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.text = title
        label.font = UIFont.makeVerdanaRegular(10)
        return label
    }

    @objc private func urlButtonDidTapped() {
        if let handler, let user {
            handler(user.url)
        }
    }
}

// MARK: - Constraints

private extension UserProfileCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
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

            userPositionLabel.topAnchor.constraint(
                equalTo: userNameLabel.bottomAnchor,
                constant: Constants.interItemInset
            ),
            userPositionLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),

            urlButton.topAnchor.constraint(equalTo: userPositionLabel.bottomAnchor, constant: 6),
            urlButton.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor, constant: 19),

            changeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            changeButton.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            changeButton.topAnchor.constraint(equalTo: urlButton.bottomAnchor, constant: 16),

            shareProfileButton.bottomAnchor.constraint(equalTo: changeButton.bottomAnchor),
            shareProfileButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5),
            shareProfileButton.widthAnchor.constraint(equalTo: changeButton.widthAnchor),

            addUserButton.bottomAnchor.constraint(equalTo: changeButton.bottomAnchor),
            addUserButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5),
            addUserButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.sideInset
            ),
            addUserButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 25),

            subscriptionsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
            subscriptionsLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),

            subscribersLabel.trailingAnchor.constraint(equalTo: subscriptionsLabel.leadingAnchor, constant: -5),
            subscribersLabel.centerYAnchor.constraint(equalTo: subscriptionsLabel.centerYAnchor),

            postsLabel.trailingAnchor.constraint(equalTo: subscribersLabel.leadingAnchor, constant: -5),
            postsLabel.centerYAnchor.constraint(equalTo: subscriptionsLabel.centerYAnchor),

            postAmountLabel.bottomAnchor.constraint(equalTo: postsLabel.topAnchor, constant: -5),
            postAmountLabel.centerXAnchor.constraint(equalTo: postsLabel.centerXAnchor),

            subscribersAmountLabel.bottomAnchor.constraint(equalTo: subscribersLabel.topAnchor, constant: -5),
            subscribersAmountLabel.centerXAnchor.constraint(equalTo: subscribersLabel.centerXAnchor),

            subscriptionAmountLabel.bottomAnchor.constraint(equalTo: subscriptionsLabel.topAnchor, constant: -5),
            subscriptionAmountLabel.centerXAnchor.constraint(equalTo: subscriptionsLabel.centerXAnchor),

        ])
    }
}
