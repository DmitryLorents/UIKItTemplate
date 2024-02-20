// PostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show product with price
final class PostCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: PostCell.self)
    private enum Constants {
        static let sideInset: CGFloat = 12
        static let interItemInset: CGFloat = 22
        static let postImageRation: CGFloat = 239 / 357
        static let defaultImage = "girl1"
        static let avatarSize: CGFloat = 30
    }

    // MARK: - Visual Components

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.avatarSize / 2
        imageView.clipsToBounds = true
        imageView.image = .man1
        return imageView
    }()

    private lazy var nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "tur_v_abudabi"
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.more, for: .normal)
        return button
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .nature4
        return imageView
    }()

    private lazy var likeButton = makeSmallButton(image: .like)
    private lazy var messageButton = makeSmallButton(image: .messageSmall)
    private lazy var sendButton = makeSmallButton(image: .send)
    private lazy var bookmarkButton = makeSmallButton(image: .bookmark)
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text = "Нравиться: 201"
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold(10)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = makeDescriptionLabelText()
        return label
    }()

    private lazy var smallAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = .girl1
        return imageView
    }()

    private lazy var commentLabel = makeVerdana10GrayLabel(text: "Комментировать...")
    private lazy var timeLabel = makeVerdana10GrayLabel(text: "10 минут вперед")

    // MARK: - Public Properties

    func setupWith(_ post: Post) {
        self.post = post
    }

    // MARK: - Private Properties

    private var post: Post?

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
        contentView.backgroundColor = .lightGray
        contentView.addSubviews(
            avatarImageView,
            nickNameLabel,
            moreButton,
            postImageView,
            likeButton,
            messageButton,
            sendButton,
            bookmarkButton,
            pageControl,
            likesLabel,
            descriptionLabel,
            smallAvatarImageView,
            commentLabel,
            timeLabel
        )
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func makeSmallButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return button
    }

    private func makeVerdana10GrayLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaRegular(10)
        label.textColor = .gray
        return label
    }

    private func makeDescriptionLabelText() -> NSMutableAttributedString {
        let nicknameString = "tur_v_abudabi"
        let boldFont = UIFont.makeVerdanaBold(10)
        let boldAttributes = [NSAttributedString.Key.font: boldFont]
        let nicknameBold = NSMutableAttributedString(
            string: nicknameString,
            attributes: boldAttributes as [NSAttributedString.Key: Any]
        )
        let description = " Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
        let regularAttribute = [NSAttributedString.Key.font: UIFont.makeVerdanaRegular(10)]
        let descriptionRegular = NSAttributedString(
            string: description,
            attributes: regularAttribute as [NSAttributedString.Key: Any]
        )
        nicknameBold.append(descriptionRegular)
        return nicknameBold
    }
}

// MARK: - Constraints

private extension PostCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([

            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideInset),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarSize),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),

            nickNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            nickNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

            moreButton.widthAnchor.constraint(equalToConstant: 14),
            moreButton.heightAnchor.constraint(equalToConstant: 2),
            moreButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideInset),
            moreButton.leadingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor, constant: Constants.sideInset),

            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            postImageView.heightAnchor.constraint(
                equalTo: postImageView.widthAnchor,
                multiplier: Constants.postImageRation
            ),

            likeButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideInset),

            messageButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            messageButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 8),

            sendButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            sendButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 8),

            bookmarkButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            bookmarkButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.sideInset
            ),

            pageControl.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            likesLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            likesLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),

            descriptionLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.sideInset
            ),

            smallAvatarImageView.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            smallAvatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            smallAvatarImageView.heightAnchor.constraint(equalToConstant: 20),
            smallAvatarImageView.widthAnchor.constraint(equalTo: smallAvatarImageView.heightAnchor),

            commentLabel.centerYAnchor.constraint(equalTo: smallAvatarImageView.centerYAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: smallAvatarImageView.trailingAnchor, constant: 4),

            timeLabel.leadingAnchor.constraint(equalTo: likeButton.leadingAnchor),
            timeLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 10),
            timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),

        ])
    }
}

