// PersonDataView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Custom view to show person data
final class PersonDataView: UIView {
    // MARK: - Private Properties

    private let personImageName: String
    private let personName: String
    private let daysRemaing: Int
    private let subLabelText: String

    private lazy var personImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 9, width: 75, height: 75))
        imageView.image = UIImage(named: personImageName)
        return imageView
    }()

    private lazy var cakeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 330, y: 25, width: 44, height: 44))
        imageView.image = UIImage(named: "birthdayCake")
        return imageView
    }()

    private lazy var daysRemainingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 330, y: 25, width: 42, height: 44))
        label.text = "\(daysRemaing)\ndays"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(named: "customPurpleColor")
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 114, y: 20, width: 209, height: 20))
        label.text = personName
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        return label
    }()

    private lazy var subLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 114, y: 52, width: 209, height: 20))
        label.text = subLabelText
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana", size: 14)
        return label
    }()

    // MARK: - Initializers

    init(imagename: String, name: String, daysRemaing: Int, subText: String, position: Int) {
        personImageName = imagename
        personName = name
        self.daysRemaing = daysRemaing
        subLabelText = subText
        let yCoordinate = CGFloat(101 + 93 * position)
        super.init(frame: CGRect(x: 0, y: yCoordinate, width: UIScreen.main.bounds.width, height: 93))
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        if daysRemaing == 0 {
            addSubview(cakeImageView)
        } else {
            addSubview(daysRemainingLabel)
        }
        addSubViews(personImageView, nameLabel, subLabel)
    }
}
