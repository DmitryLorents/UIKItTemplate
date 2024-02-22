// StoriesViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show line of stories
final class StoriesViewCell: UITableViewCell {
    // MARK: - Constants

    /// Constants of StoriesViewCell
    private enum Constants {
        /// Standard inset from left or right side
        static let sideInset: CGFloat = 12
        /// Standard inset per items
        static let interItemInset: CGFloat = 22
        /// Ttitle for first StoryView
        static let defaultName = "Ваша история"
        /// Image name for first StoryView
        static let defaultImage = "girl1"
    }

    static let reuseID = String(describing: StoriesViewCell.self)

    // MARK: - Visual Components

    private let storiesScrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    // MARK: - Private Properties

    private let defaultStory = Story(userName: Constants.defaultName, imageName: Constants.defaultImage)
    private var stories: [Story]? {
        didSet {
            stories?.insert(defaultStory, at: 0)
            makeSubviews()
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

    func setupWith(_ stories: [Story]) {
        self.stories = stories
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(storiesScrollView)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func makeSubviews() {
        guard let stories else { return }
        let viewWidth: CGFloat = 60
        for (index, story) in stories.enumerated() {
            let storyView = StoryView(story: story, isStartView: index == 0)
            storyView.translatesAutoresizingMaskIntoConstraints = false
            storiesScrollView.addSubview(storyView)

            // setup constraints
            let leadingInset = Constants.sideInset + (CGFloat(index) * (Constants.interItemInset + viewWidth))
            storyView.leadingAnchor.constraint(equalTo: storiesScrollView.leadingAnchor, constant: leadingInset)
                .isActive = true
            storyView.topAnchor.constraint(equalTo: storiesScrollView.topAnchor).isActive = true
            if index == stories.count - 1 {
                NSLayoutConstraint.activate([
                    // set cell height
                    storyView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1),

                    storyView.bottomAnchor.constraint(equalTo: storiesScrollView.bottomAnchor),
                    storyView.trailingAnchor.constraint(
                        greaterThanOrEqualTo: storiesScrollView.trailingAnchor,
                        constant: -Constants.sideInset
                    )
                ])
            }
        }
    }
}

// MARK: - Constraints

private extension StoriesViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storiesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storiesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            storiesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storiesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
