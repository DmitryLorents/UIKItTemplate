// AnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show how anchor constraints are working
class AnchorViewController: UIViewController {
    // MARK: - Constants

    private enum Inset {
        static let minVertical: CGFloat = 30
        static let minHorizintal: CGFloat = 107
        static let maxValue: CGFloat = 1000
    }

    // MARK: - Visual Components

    private let blackView = UIView()
    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        blackView.backgroundColor = .black
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        let subviews = [blackView, redView, yellowView, greenView]
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        subviews.forEach { view.addSubview($0) }
        setupConstraints()
    }
}

private extension AnchorViewController {
    func setupConstraints() {
        setupBlackViewConstraints()
    }

    func setupBlackViewConstraints() {
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let topMin = blackView.topAnchor.constraint(
            greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
            constant: Inset.minVertical
        )
        topMin.isActive = true

        let verticalMax = blackView.topAnchor.constraint(
            lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
            constant: Inset.maxValue
        )
        verticalMax.isActive = true

        let horizontalMin = blackView.leadingAnchor.constraint(
            greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 107
        )
        horizontalMin.isActive = true

        let horizontalMax = blackView.leadingAnchor.constraint(
            lessThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: Inset.maxValue
        )
        horizontalMax.isActive = true

        let height = blackView.heightAnchor.constraint(equalToConstant: Inset.maxValue)
        height.priority = .defaultLow
        height.isActive = true

        let width = blackView.widthAnchor.constraint(equalToConstant: Inset.maxValue)
        width.priority = .defaultLow
        width.isActive = true
    }
}
