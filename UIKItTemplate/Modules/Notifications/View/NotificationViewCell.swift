// NotificationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show notification
final class NotificationViewCell: UITableViewCell {
    // MARK: - Constants

    /// Constants for NotificationViewCell
    private enum Constants {
        /// Standard inset from left or right side
        static let sideInset: CGFloat = 12
        /// Inset per views
        static let interItemInset: CGFloat = 7
        /// Width and height of avatarImageView
        static let imageSize: CGFloat = 40
        /// Title for subscribe button
        static let buttonTitle = "Подписаться"
        /// Comment text in case of like type of cell
        static let commentLike = " понравился ваш комментарий: "
        /// Comment text in case of subscribe type of cell
        static let commentSubscribe = " появился(-ась) в RMLink. Вы можете быть знакомы"
    }

    static let reuseID = String(describing: NotificationViewCell.self)

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.imageSize / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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

    // MARK: - Private Properties

    private var type: Notice.NoticeType?
    private var notice: Notice? {
        didSet {
            if let notice {
                updateUI(notice: notice)
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

    // MARK: - Public Methods

    func setupWith(_ notification: Notice?) {
        notice = notification
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubviews(avatarImageView, descriptionLabel)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func updateUI(notice: Notice) {
        avatarImageView.image = UIImage(named: notice.avatarImage)
        descriptionLabel.attributedText = makeDescriptionLabelText(notice: notice)
        switch notice.type {
        case .like:
            contentView.addSubview(postImageView)
            postImageView.image = UIImage(named: notice.postImage)
            // constraints
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
            // constraints
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
        }
        contentView.disableTARMIC()
    }

    private func makeDescriptionLabelText(notice: Notice) -> NSMutableAttributedString {
        let boldFont = UIFont.makeVerdanaBold(12)
        let boldAttributes = [NSAttributedString.Key.font: boldFont]
        let output = NSMutableAttributedString(
            string: notice.userName,
            attributes: boldAttributes as [NSAttributedString.Key: Any]
        )

        let comment: String
        switch notice.type {
        case .like:
            comment = "\(Constants.commentLike)\(notice.description)\" "
        case .subscribe:
            comment = Constants.commentSubscribe
        }
        let regularAttribute = [NSAttributedString.Key.font: UIFont.makeVerdanaRegular(12)]
        let descriptionRegular = NSAttributedString(
            string: comment,
            attributes: regularAttribute as [NSAttributedString.Key: Any]
        )

        let regularGrayAttribute = [
            NSAttributedString.Key.font: UIFont.makeVerdanaRegular(12),
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        let timePastRegularGray = NSAttributedString(
            string: notice.timePast,
            attributes: regularGrayAttribute as [NSAttributedString.Key: Any]
        )
        output.append(descriptionRegular)
        output.append(timePastRegularGray)
        return output
    }
}

// MARK: - Constraints

private extension NotificationViewCell {
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
