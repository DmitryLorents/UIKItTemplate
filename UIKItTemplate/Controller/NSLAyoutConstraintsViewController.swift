// NSLAyoutConstraintsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show how NSLayoutConstraints constraints are working
final class NSLAyoutConstraintsViewController: UIViewController {
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
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}

private extension NSLAyoutConstraintsViewController {
    func setupConstraints() {
        setupBlackViewConstraints()
        setupYellowViewConstraints()
        setupRedViewConstraints()
        setupGreenViewConstraints()
    }

    func setupBlackViewConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: blackView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: blackView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            ),

            NSLayoutConstraint(
                item: blackView,
                attribute: .top,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: .topMargin,
                multiplier: 1,
                constant: Inset.minVertical
            ),
            NSLayoutConstraint(
                item: blackView,
                attribute: .top,
                relatedBy: .lessThanOrEqual,
                toItem: view,
                attribute: .topMargin,
                multiplier: 1,
                constant: Inset.maxValue
            ),
            NSLayoutConstraint(
                item: blackView,
                attribute: .leading,
                relatedBy: .greaterThanOrEqual,
                toItem: view,
                attribute: .leading,
                multiplier: 1,
                constant: Inset.minHorizintal
            ),
            NSLayoutConstraint(
                item: blackView,
                attribute: .leading,
                relatedBy: .lessThanOrEqual,
                toItem: view,
                attribute: .leading,
                multiplier: 1,
                constant: Inset.maxValue
            ),
        ])

        let height = NSLayoutConstraint(
            item: blackView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: Inset.maxValue
        )
        height.priority = .defaultLow
        height.isActive = true

        let width = NSLayoutConstraint(
            item: blackView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: Inset.maxValue
        )
        width.priority = .defaultLow
        width.isActive = true
    }

    func setupYellowViewConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),

            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: yellowView,
                attribute: .height,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .width,
                multiplier: 1,
                constant: 0
            ),

            NSLayoutConstraint(
                item: yellowView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: blackView,
                attribute: .leading,
                multiplier: 1,
                constant: Inset.subViewHorizintal
            ),
        ])
    }

    func setupRedViewConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: redView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),

            NSLayoutConstraint(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .height,
                multiplier: 1,
                constant: 0
            ),

            NSLayoutConstraint(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: redView,
                attribute: .width,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .top,
                relatedBy: .equal,
                toItem: blackView,
                attribute: .top,
                multiplier: 1,
                constant: Inset.subViewVertical
            ),
            NSLayoutConstraint(
                item: redView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .top,
                multiplier: 1,
                constant: -Inset.subViewVertical
            ),
        ])
    }

    func setupGreenViewConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: greenView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .height,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: greenView,
                attribute: .width,
                multiplier: 1,
                constant: 0
            ),
            NSLayoutConstraint(
                item: greenView,
                attribute: .top,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .bottom,
                multiplier: 1,
                constant: Inset.subViewVertical
            ),
        ])
    }
}
