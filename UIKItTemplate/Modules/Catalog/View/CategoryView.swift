// CategoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class CategoryView: UIView {
    // MARK: - Constants

    let leftInset: CGFloat = 20

    // MARK: - Visual Components

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = title
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold14()
        label.sizeToFit()
        label.frame.origin = .zero
        return label
    }()

    private lazy var categoryImageView: UIImageView = {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        return imageView
    }()

    // MARK: - Private Properties

    private let title: String
    private let imageName: String

    // MARK: - Initializers

    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        super.init(frame: .zero)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        backgroundColor = .lightGrayApp
        addSubviews(categoryLabel, categoryImageView)
        disableTARMIC()
        setConstraints()
    }
}

private extension CategoryView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftInset),
            categoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor),

            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            categoryImageView.topAnchor.constraint(equalTo: topAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }
}
