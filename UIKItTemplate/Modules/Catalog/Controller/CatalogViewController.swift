// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class CatalogViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum Text {
            static let title = "Каталог"
        }

        enum BuyerTypes: String, CaseIterable {
            case woman = "Женщинам"
            case man = "Мужчинам"
            case child = "Детям"
        }

        enum Size {
            static let generalInset: CGFloat = 20
            static let topInset: CGFloat = 25
            static var segmentedControlHeight: CGFloat = 44
        }
    }

    // MARK: - Visual Components

    private lazy var buyerTypeSegmentedControl: UISegmentedControl = {
        let types = Array(Constants.BuyerTypes.allCases).map(\.rawValue)
        let view = UISegmentedControl(items: types)
        view.selectedSegmentIndex = 0
        return view
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        title = Constants.Text.title
        view.addSubviews(buyerTypeSegmentedControl)
        view.disableTARMIC()
    }

    private func setConstraints() {
        let inset = Constants.Size.generalInset
        NSLayoutConstraint.activate([
            buyerTypeSegmentedControl.heightAnchor.constraint(equalToConstant: Constants.Size.segmentedControlHeight),
            buyerTypeSegmentedControl.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Size.topInset
            ),
            buyerTypeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            buyerTypeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset)
        ])
    }
}
