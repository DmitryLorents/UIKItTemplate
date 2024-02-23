// PostViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show product with price
final class PostViewCell: UITableViewCell {
    // MARK: - Constants

    /// Constants for PostViewCell
    private enum Constants {
        /// Standard inset from left or right side
        static let sideInset: CGFloat = 12
        /// Inset per views
        static let interItemInset: CGFloat = 22
        /// Image ration for main imageViews in post
        static let postImageRation: CGFloat = 239 / 357
        /// Width and height for avatarImageView
        static let avatarSize: CGFloat = 30
        /// Image name for user
        static let defaultImage = "girl1"
        /// Ttile for likesLabel
        static let likesAmount = "Нравиться: 201"
        /// Title for comment label
        static let comment = "Комментировать..."
        /// Title for timeStamp label
        static let timeStamp = "10 минут вперед"
    }

    static let reuseID = String(describing: PostViewCell.self)

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
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold(16)
        return label
    }()

    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.more, for: .normal)
        return button
    }()

    private lazy var imagesScrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = self
        return view
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
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()

    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.likesAmount
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold(10)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    private lazy var smallAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = .girl1
        return imageView
    }()

    private lazy var commentLabel = makeVerdana10GrayLabel(text: Constants.comment)
    private lazy var timeLabel = makeVerdana10GrayLabel(text: Constants.timeStamp)

    // MARK: - Private Properties

    private var post: Post? {
        didSet {
            if let post {
                setupUI(post: post)
            }
        }
    }

    // MARK: - Public methods

    func setupWith(_ post: Post?) {
        self.post = post
    }

    // MARK: - Private Methods

    private func setupUI(post: Post) {
        contentView.addSubviews(
            avatarImageView,
            nickNameLabel,
            moreButton,
            imagesScrollView,
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
        setupUIData(post: post)
        contentView.disableTARMIC()

        setupConstraints()
    }

    private func setupUIData(post: Post) {
        avatarImageView.image = UIImage(named: post.avatarImageName)
        nickNameLabel.text = post.nickName
        makeSubviews(post: post)
        pageControl.numberOfPages = post.imageNames.count
        descriptionLabel.attributedText = makeDescriptionLabelText(post: post)
        timeLabel.text = post.timeStamp
    }

    private func makeSubviews(post: Post) {
        let screenWidth = UIScreen.main.bounds.width
        for (index, image) in post.imageNames.enumerated() {
            let imageView = UIImageView()
            imageView.image = UIImage(named: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imagesScrollView.addSubview(imageView)

            // setup constraints
            let leadingInset = CGFloat(index) * screenWidth
            imageView.leadingAnchor.constraint(equalTo: imagesScrollView.leadingAnchor, constant: leadingInset)
                .isActive = true
            imageView.topAnchor.constraint(equalTo: imagesScrollView.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: imagesScrollView.bottomAnchor).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: Constants.postImageRation)
                .isActive = true
            if index == post.imageNames.count - 1 {
                imageView.trailingAnchor.constraint(greaterThanOrEqualTo: imagesScrollView.trailingAnchor)
                    .isActive = true
            }
        }
    }

    private func makeDescriptionLabelText(post: Post) -> NSMutableAttributedString {
        let boldFont = UIFont.makeVerdanaBold(10) ?? UIFont.boldSystemFont(ofSize: 10)
        let output = NSMutableAttributedString(
            string: post.nickName,
            attributes: [.font: boldFont]
        )

        let regularFont = UIFont.makeVerdanaRegular(10) ?? UIFont.systemFont(ofSize: 10)
        let titleRegular = NSAttributedString(
            string: " \(post.title)",
            attributes: [.font: regularFont]
        )
        output.append(titleRegular)
        return output
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
}

// MARK: - Constraints

private extension PostViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.sideInset),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarSize),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),

            nickNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),
            nickNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

            moreButton.widthAnchor.constraint(equalToConstant: 14),
            moreButton.heightAnchor.constraint(equalToConstant: 2),
            moreButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideInset),
            moreButton.leadingAnchor.constraint(equalTo: nickNameLabel.trailingAnchor, constant: Constants.sideInset),

            imagesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagesScrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            imagesScrollView.heightAnchor.constraint(
                equalTo: imagesScrollView.widthAnchor,
                multiplier: Constants.postImageRation
            ),

            likeButton.topAnchor.constraint(equalTo: imagesScrollView.bottomAnchor, constant: 8),
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

// MARK: - PostCell: UIScrollViewDelegate

extension PostViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
