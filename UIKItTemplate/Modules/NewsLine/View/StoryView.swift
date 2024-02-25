// StoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show story
final class StoryView: UIView {
    // MARK: - Constants

    /// Type of border color
    enum BorderType {
        /// Gray border color
        case gray
        /// Gradient border color
        case colored
    }

    private enum Constants {
        static let whiteBorderWidth = 2.0
        static let coloredBorderWidth = 2.0
        static let userImageViewSize = 60.0 + 2 * whiteBorderWidth
        static let borderViewSize = userImageViewSize + 2 * coloredBorderWidth
        static let plusButtonSize = 20.0
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
        imageView.layer.cornerRadius = Constants.userImageViewSize / 2
        imageView.layer.borderWidth = Constants.whiteBorderWidth
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    private lazy var borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.borderViewSize / 2
        let borderColor: UIColor = story.isWatched ? .lightGray : .orange
        view.backgroundColor = isStartView ? .white : borderColor
        return view
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .redApp
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(12)
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = Constants.plusButtonSize / 2
        button.isHidden = !isStartView
        return button
    }()

    // MARK: - Public Properties

    var showStoryhandler: (() -> ())?

    // MARK: - Private Properties

    private let story: Story
    private let isStartView: Bool

    // MARK: - Initializers

    init(story: Story, isStartView: Bool = false) {
        self.story = story
        self.isStartView = isStartView
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupView() {
        setupViewTapAction()
        addSubviews(nameLabel, borderView, userImageView, plusButton)
        disableTARMIC()
        setupConstraints()
    }

    private func setupViewTapAction() {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewIsTapped))
        addGestureRecognizer(tapGesture)
    }

    @objc private func viewIsTapped() {
        if !isStartView {
            borderView.backgroundColor = .lightGray
        }
        if let showStoryhandler {
            showStoryhandler()
        }
    }
}

// MARK: - Constraints

private extension StoryView {
    func setupConstraints() {
        setupBorderViewConstraints()
        setupUserImageViewConstraints()
        setupNameLabelConstraints()
        setupPlusButtonConstraints()
    }

    func setupBorderViewConstraints() {
        NSLayoutConstraint.activate([
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            borderView.heightAnchor.constraint(equalToConstant: Constants.borderViewSize),
            borderView.widthAnchor.constraint(equalTo: borderView.heightAnchor),

        ])
    }

    func setupUserImageViewConstraints() {
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalToConstant: Constants.userImageViewSize),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor),
            userImageView.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            userImageView.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
        ])
    }

    func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
        ])
    }

    func setupPlusButtonConstraints() {
        NSLayoutConstraint.activate([
            plusButton.trailingAnchor.constraint(
                equalTo: userImageView.trailingAnchor,
                constant: -Constants.whiteBorderWidth
            ),
            plusButton.bottomAnchor.constraint(
                equalTo: userImageView.bottomAnchor,
                constant: -Constants.whiteBorderWidth
            ),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.plusButtonSize),
            plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor)
        ])
    }
}
