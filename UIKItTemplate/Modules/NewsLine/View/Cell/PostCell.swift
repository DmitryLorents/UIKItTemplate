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
        label.text = "Нравиться: 201"
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

    private lazy var commentLabel = makeVerdana10GrayLabel(text: "Комментировать...")
    private lazy var timeLabel = makeVerdana10GrayLabel(text: "10 минут вперед")

    // MARK: - Public Properties

    func setupWith(_ post: Post?) {
        self.post = post
    }

    // MARK: - Private Properties

    private var post: Post? {
        didSet {
            if let post {
                setupUI(post: post)
            }
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        let boldFont = UIFont.makeVerdanaBold(10)
        let boldAttributes = [NSAttributedString.Key.font: boldFont]
        let output = NSMutableAttributedString(
            string: post.nickName,
            attributes: boldAttributes as [NSAttributedString.Key: Any]
        )

        let regularAttribute = [NSAttributedString.Key.font: UIFont.makeVerdanaRegular(10)]
        let titleRegular = NSAttributedString(
            string: " \(post.title)",
            attributes: regularAttribute as [NSAttributedString.Key: Any]
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

// MARK: - UIScrollViewDelegate

extension PostCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
