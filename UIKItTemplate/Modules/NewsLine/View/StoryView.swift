// StoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show story
final class StoryView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let imageSize: CGFloat = 60
        static let plusButtonSize: CGFloat = 20
        static let defaultText = "Ваша история"
    }

    // MARK: - Visual Components

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = isStartView ? Constants.defaultText : story.userName
        label.textColor = isStartView ? .gray : .label
        label.textAlignment = .center
        label.font = .makeVerdanaRegular(8)
        return label
    }()

    private lazy var userImageView: UIImageView = {
        let image = UIImage(named: story.imageName)
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = userImageCornerRadius
        return imageView
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .redApp
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(12)
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = plusButtonCornerRadius
        button.isHidden = !isStartView
        return button
    }()

    // MARK: - Private Properties

    private let story: Story
    private let isStartView: Bool
    private var userImageCornerRadius: CGFloat {
        Constants.imageSize / 2
    }

    var plusButtonCornerRadius: CGFloat {
        Constants.plusButtonSize / 2
    }

    // MARK: - Initializers

    init(story: Story, isStartView: Bool = false) {
        self.story = story
        self.isStartView = isStartView
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubviews(nameLabel, userImageView, plusButton)
        disableTARMIC()
        setupConstraints()
    }
}

// MARK: - Set constraints

private extension StoryView {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor, multiplier: 1),
            userImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor),

            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),

            plusButton.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            plusButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.plusButtonSize),
            plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor)

        ])
    }
}
