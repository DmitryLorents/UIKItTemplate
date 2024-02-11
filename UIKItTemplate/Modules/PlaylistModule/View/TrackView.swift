// TrackView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Custom view to show person data
final class TrackView: UIView {
    // MARK: - Private Properties

    private let track: Track

    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 9, width: 75, height: 75))
        imageView.image = UIImage(named: track.image)
        return imageView
    }()

    private lazy var artistLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 114, y: 20, width: 209, height: 20))
        label.text = track.artist
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private lazy var trackNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 114, y: 52, width: 209, height: 20))
        label.text = track.name
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    private lazy var durationLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 330, y: 25, width: 42, height: 44))
        label.text = track.duration
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(named: "customPurpleColor")
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    // MARK: - Initializers

    init(track: Track, position: Int) {
        self.track = track
        let yCoordinate = CGFloat(101 + 93 * position)
        super.init(frame: CGRect(x: 0, y: yCoordinate, width: UIScreen.main.bounds.width, height: 93))
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        addSubViews(coverImageView, artistLabel, trackNameLabel, durationLabel)
    }
}
