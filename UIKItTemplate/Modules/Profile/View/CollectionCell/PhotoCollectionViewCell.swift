// PhotoCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// View to show a photo in collection
final class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants

    static let reuseId = String(describing: PhotoCollectionViewCell.self)

    // MARK: - Visual Components

    private let photoImageView = UIImageView()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Public Methods

    func setupWith(imageName: String) {
        photoImageView.image = UIImage(named: imageName)
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(photoImageView)
        contentView.disableTARMIC()
        setupConstraints()
    }
}

// MARK: - Constraints

private extension PhotoCollectionViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3 - 1),

            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
