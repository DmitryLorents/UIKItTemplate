// SizeChoosingLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SizeChoosingLabel: UILabel {
    // MARK: - Constants

    private let euroSize = " EU"

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
        text = "\(size)\(euroSize)"
        textAlignment = .left
        font = UIFont.makeVerdana16()
        sizeToFit()
    }
}
