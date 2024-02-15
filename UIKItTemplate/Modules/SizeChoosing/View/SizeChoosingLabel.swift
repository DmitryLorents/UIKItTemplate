// SizeChoosingLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SizeChoosingLabel: UILabel {
    // MARK: - Constants

    private let euroSize = " EU"

    // MARK: - Visual Components

//    private lazy var sizeLabel: UILabel = {
//        let label = UILabel()
//        label.text = "\(size)\(Constants.euroSize)"
//        label.textAlignment = .left
//        label.font = UIFont.makeVerdanaBold10()
//        label.sizeToFit()
//        return label
//    }()
//
//    private lazy var productImageView: UIImageView = {
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image)
//        return imageView
//    }()
//
//    private lazy var basketImageView: UIImageView = {
//        let imageName = Constants.Image.basketGray
//        let imageView = UIImageView(image: UIImage(named: imageName))
//        return imageView
//    }()

    // MARK: - Private Properties

    private let size: Int

    // MARK: - Initializers

    init(shoesSize: Int) {
        size = shoesSize
        super.init(frame: .zero)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        text = "\(size)\(euroSize)"
        textAlignment = .left
        font = UIFont.makeVerdana16()
        sizeToFit()
    }
}
