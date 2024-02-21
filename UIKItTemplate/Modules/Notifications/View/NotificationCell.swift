// NotificationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show product with price
final class NotificationCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: NotificationCell.self)
    private enum Constants {
        static let sideInset: CGFloat = 12
        static let interItemInset: CGFloat = 7
        static let imageSize: CGFloat = 40
        static let buttonTitle = "Подписаться"
    }

    // MARK: - Visual Components

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.imageSize / 2
        imageView.clipsToBounds = true
        imageView.image = .girl2
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = makeDescriptionLabelText()
        return label
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .nature4
        return imageView
    }()

    private lazy var subscribeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blueApp
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.makeVerdanaBold(10)
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    // MARK: - Public Properties

    func setupWith(_ notification: Notice?) {
        self.notification = notification
    }

    // MARK: - Private Properties

    private var type: Notice.NoticeType?
    private var notification: Notice? {
        didSet {
            if notification != nil {
                updateUI()
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

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubviews(avatarImageView, descriptionLabel)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func updateUI() {
        switch notification?.type {
        case .like:
            contentView.addSubview(postImageView)
            NSLayoutConstraint.activate([
                postImageView.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -Constants.sideInset
                ),
                postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                postImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
                postImageView.widthAnchor.constraint(equalTo: postImageView.heightAnchor),
                postImageView.leadingAnchor.constraint(
                    equalTo: descriptionLabel.trailingAnchor,
                    constant: Constants.interItemInset
                )
            ])
        case .subscribe:
            contentView.addSubview(subscribeButton)
            NSLayoutConstraint.activate([
                subscribeButton.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -Constants.sideInset
                ),
                subscribeButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
                subscribeButton.heightAnchor.constraint(equalToConstant: 30),
                subscribeButton.widthAnchor.constraint(equalToConstant: 140),
                subscribeButton.leadingAnchor.constraint(
                    equalTo: descriptionLabel.trailingAnchor,
                    constant: Constants.interItemInset
                )
            ])
        case .none:
            return
        }
        contentView.disableTARMIC()
    }

    private func makeDescriptionLabelText() -> NSMutableAttributedString {
        let nicknameString = "lavande_123"
        let boldFont = UIFont.makeVerdanaBold(12)
        let boldAttributes = [NSAttributedString.Key.font: boldFont]
        let nicknameBold = NSMutableAttributedString(
            string: nicknameString,
            attributes: boldAttributes as [NSAttributedString.Key: Any]
        )
        let description = " понравился ваш комментарий: \"Очень красиво!\" "
        let regularAttribute = [NSAttributedString.Key.font: UIFont.makeVerdanaRegular(12)]
        let descriptionRegular = NSAttributedString(
            string: description,
            attributes: regularAttribute as [NSAttributedString.Key: Any]
        )
        let timaPast = "12ч"
        let regularGrayAttribute = [
            NSAttributedString.Key.font: UIFont.makeVerdanaRegular(12),
            NSAttributedString.Key.strokeColor: UIColor.gray
        ]
        let timePastRegular = NSAttributedString(
            string: timaPast,
            attributes: regularGrayAttribute as [NSAttributedString.Key: Any]
        )
        nicknameBold.append(descriptionRegular)
        nicknameBold.append(timePastRegular)
        return nicknameBold
    }
}

// MARK: - Constraints

private extension NotificationCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 50),

            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideInset),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7),
            descriptionLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 0),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: 0),

        ])
    }
}
