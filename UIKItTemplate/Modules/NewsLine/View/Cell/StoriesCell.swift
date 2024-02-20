// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show line of stories
final class StoriesCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: StoriesCell.self)
    private enum Constants {
        static let sideInset: CGFloat = 12
        static let interItemInset: CGFloat = 22
        static let defaultName = "Ваша история"
        static let defaultImage = "girl1"
    }

    // MARK: - Visual Components

    private lazy var storiesScrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    // MARK: - Public Properties

    func setupWith(_ stories: [Story]) {
        self.stories = stories
    }

    // MARK: - Private Properties

    private let defaultStory = Story(userName: Constants.defaultName, imageName: Constants.defaultImage)
    var stories: [Story]? {
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

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storiesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            storiesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            storiesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storiesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
