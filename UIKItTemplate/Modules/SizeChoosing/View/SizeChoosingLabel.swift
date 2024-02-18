// SizeChoosingLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Reusable view for SizeChoosingVC
final class SizeChoosingLabel: UILabel {
    // MARK: - Constants

    private enum Constants {
        static let euroSize = " EU"
        static let font = UIFont.makeVerdanaRegular(16)
    }

    // MARK: - Private Properties

    let size: Int

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
        text = "\(size)\(Constants.euroSize)"
        textAlignment = .left
        font = Constants.font
        sizeToFit()
    }
}
