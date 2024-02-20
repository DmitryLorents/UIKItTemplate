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
        static let defaultName = "Ваша история"
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
        imageView.image = .man1
        return imageView
    }()

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
        contentView.addSubviews(avatarImageView, nickNameLabel, moreButton)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 120),

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
            

        ])
    }
}
