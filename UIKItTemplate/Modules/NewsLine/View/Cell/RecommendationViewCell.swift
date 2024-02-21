// RecommendationViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Cell to show line of recommendations
final class RecommendationViewCell: UITableViewCell {
    // MARK: - Constants

    static let reuseID = String(describing: RecommendationViewCell.self)
    /// Constants for RecomendationViewCell
    private enum Constants {
        /// Standard inset from left or right side
        static let sideInset: CGFloat = 17
        /// Inset per views
        static let interItemInset: CGFloat = 20
        /// Title for recomendationLabel
        static let recomendation = "Рекомендуем вам"
        /// Title for showAllLabel
        static let showAllLabelTitle = "Все"
    }

    // MARK: - Visual Components

    private let recomendationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recomendation
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaBold(10)
        return label
    }()

    private let showAllLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.showAllLabelTitle
        label.textAlignment = .right
        label.textColor = .blueApp
        label.font = UIFont.makeVerdanaBold(10)
        return label
    }()

    private lazy var recomendationsScrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    // MARK: - Public Properties

    func setupWith(_ recomendations: [Recomendation]) {
        self.recomendations = recomendations
    }

    // MARK: - Private Properties

    var recomendations: [Recomendation]? {
        didSet {
            makeSubviews()
        }
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupUI() {
        backgroundColor = .lightBlueApp
        contentView.addSubviews(recomendationLabel, showAllLabel, recomendationsScrollView)
        contentView.disableTARMIC()
        setupConstraints()
    }

    private func makeSubviews() {
        guard let recomendations else { return }
        let viewWidth: CGFloat = 185
        for (index, recomendation) in recomendations.enumerated() {
            let recomendationView = RecomendationView(recomendation: recomendation)
            recomendationView.translatesAutoresizingMaskIntoConstraints = false
            recomendationsScrollView.addSubview(recomendationView)

            // setup constraints
            let leadingInset = CGFloat(index) * (Constants.interItemInset + viewWidth)
            recomendationView.leadingAnchor.constraint(
                equalTo: recomendationsScrollView.leadingAnchor,
                constant: leadingInset
            )
            .isActive = true
            recomendationView.topAnchor.constraint(equalTo: recomendationsScrollView.topAnchor).isActive = true
            if index == recomendations.count - 1 {
                NSLayoutConstraint.activate([
                    // set cell height
                    recomendationView.heightAnchor.constraint(
                        equalTo: recomendationsScrollView.heightAnchor,
                        multiplier: 1
                    ),

                    recomendationView.bottomAnchor.constraint(equalTo: recomendationsScrollView.bottomAnchor),
                    recomendationView.trailingAnchor.constraint(
                        greaterThanOrEqualTo: recomendationsScrollView.trailingAnchor
                    )
                ])
            }
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            recomendationLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.sideInset
            ),
            recomendationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9),

            showAllLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sideInset),
            showAllLabel.topAnchor.constraint(equalTo: recomendationLabel.topAnchor),

            recomendationsScrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            recomendationsScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            recomendationsScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            recomendationsScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
        ])
    }
}
