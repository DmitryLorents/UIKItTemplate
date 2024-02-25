// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show how stack constraints are working
class StackViewController: UIViewController {
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
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.spacing = Inset.subViewInterItem
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()

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
        view.addSubview(blackView)
        view.addSubview(stackView)
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        setupConstraints()
    }

    private func roundSubViews() {
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}

private extension StackViewController {
    func setupConstraints() {
        setupBlackViewConstraints()
        setupStackViewConstraints()
        setupRedViewConstraints()
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

    func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: blackView.topAnchor, constant: Inset.subViewVertical),
            stackView.bottomAnchor.constraint(equalTo: blackView.bottomAnchor, constant: -Inset.subViewVertical),
            stackView.leadingAnchor.constraint(equalTo: blackView.leadingAnchor, constant: Inset.subViewHorizintal),
            stackView.trailingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: -Inset.subViewHorizintal),
        ])
    }

    func setupRedViewConstraints() {
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
    }
}
