// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show product with price
final class StoriesCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: StoryView.self)
    private enum Constants {
        static let sideInset: CGFloat = 12
        static let interItemInset: CGFloat = 22
    }

    // MARK: - Public Properties

    func setupWith(_ stories: [Story]) {
        self.stories = stories
    }

    // MARK: - Private Properties

    var stories: [Story]? {
        didSet {
            setupUI()
        }
    }

//    = [
//        .init(userName: "liver 15", imageName: "girl1"),
//        .init(userName: "shaverma 33", imageName: "girl2"),
//        .init(userName: "liver 15", imageName: "girl3"),
//        .init(userName: "liver 15", imageName: "girl4")
//    ]

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Init")
        print("Stories: \(stories)")
        setupUI()
    }

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = .cyan
        makeSubviews()
        contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 75).isActive = true
    }

    private func makeSubviews() {
        guard let stories else {
            print("No stories")
            return
        }
        print("Count: \(stories.count)")
        for (index, story) in stories.enumerated() {
            let storyView = StoryView(story: story, isStartView: index == 0)
            print(story.userName)
            storyView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(storyView)
            // setup constraints
            let leadingInset = Constants.sideInset + (CGFloat(index) * (Constants.interItemInset + 60))
            storyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadingInset)
                .isActive = true
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
