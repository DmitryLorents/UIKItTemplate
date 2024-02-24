// UserPhotosViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show user photos
final class UserPhotosViewCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: UserPhotosViewCell.self)

    // MARK: - Visual Components

    private lazy var photosCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: makeFlowLayout())
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reuseId)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Public methods

    func setupDelegates(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        photosCollectionView.delegate = delegate
        photosCollectionView.dataSource = dataSource
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = .gray
        contentView.addSubview(photosCollectionView)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func makeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        return layout
    }
}

// MARK: - Constraints

private extension UserPhotosViewCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            photosCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
