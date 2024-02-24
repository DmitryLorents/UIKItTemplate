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
        static let subViewVertical: CGFloat = 15
        static let subViewHorizintal: CGFloat = 25
        static let subViewInterItem: CGFloat = 8
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundSubViews()
    }

    override func willTransition(
        to newCollection: UITraitCollection,
        with coordinator: UIViewControllerTransitionCoordinator
    ) {
        roundSubViews()
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

    private func roundSubViews() {
        print(#function)
        print(redView.frame.width)
        print(redView.layer.cornerRadius)
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}

private extension AnchorViewController {
    func setupConstraints() {
        setupBlackViewConstraints()
        setupYellowViewConstraints()
        setupRedViewConstraints()
        setupGreenViewConstraints()
    }

    func setupBlackViewConstraints() {
        NSLayoutConstraint.activate([
            blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            blackView.topAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Inset.minVertical
            ),

            blackView.topAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Inset.maxValue
            ),

            blackView.leadingAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Inset.minHorizintal
            ),

            blackView.leadingAnchor.constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Inset.maxValue
            ),
        ])

        let height = blackView.heightAnchor.constraint(equalToConstant: Inset.maxValue)
        height.priority = .defaultLow
        height.isActive = true

        let width = blackView.widthAnchor.constraint(equalToConstant: Inset.maxValue)
        width.priority = .defaultLow
        width.isActive = true
    }

    func setupYellowViewConstraints() {
        NSLayoutConstraint.activate([
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor),
            yellowView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: Inset.subViewHorizintal),
        ])
    }

    func setupRedViewConstraints() {
        NSLayoutConstraint.activate([
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor),
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor),
            redView.topAnchor.constraint(equalTo: blackView.topAnchor, constant: Inset.subViewVertical),
            redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -Inset.subViewInterItem)
        ])
    }

    func setupGreenViewConstraints() {
        NSLayoutConstraint.activate([
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor),
            greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor),
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: Inset.subViewInterItem),
        ])
    }
}
