// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show product with price
final class StoriesCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sideInset: CGFloat = 12
        static let interItemInset: CGFloat = 22
    }

    // MARK: - Private Properties

    private let stories: [Story]

    // MARK: - Initializers

    init(stories: [Story]) {
        self.stories = stories
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = .cyan
        makeSubviews()
        disableTARMIC()
    }

    private func makeSubviews() {
        for (index, story) in stories.enumerated() {
            let storyView = StoryView(story: story, isStartView: index == 0)
            // setup constraints
            let leadingInset = Constants.sideInset + CGFloat(index) * Constants.interItemInset
            storyView.leftAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadingInset).isActive = true
            storyView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
            if index == stories.count - 1 {
                NSLayoutConstraint.activate([
                    storyView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                    storyView.trailingAnchor.constraint(
                        equalTo: contentView.trailingAnchor,
                        constant: -Constants.sideInset
                    )
                ])
            }
        }
    }
}
