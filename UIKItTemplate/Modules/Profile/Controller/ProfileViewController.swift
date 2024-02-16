// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница профиля пользователя
class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let myDataImage = "my_data"
        static let inviteFriendsImage = "invite_friend"
        static let feedBackImage = "message"

        enum Insets {
            static let left = CGFloat(20)
            static let buttonWidth = CGFloat(183)
            static let buttonHeight = CGFloat(24)
        }
    }

    // MARK: - Visual Components

    private let profileLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textColorBlack")
        label.text = "Профиль"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let cardView = CardView()

    private let personalInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "textColorBlack")
        label.text = "Личные данные"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let myDataButton = PersonalButton(
        imageName: Constants.myDataImage,
        titleText: "Мои данные"
    )

    private lazy var myDataLineView = makeLineView()

    private let inviteFriendButton = PersonalButton(
        imageName: Constants.inviteFriendsImage,
        titleText: "Приведи друга"
    )

    private lazy var inviteFriendLineView = makeLineView()

    private let messageButton = PersonalButton(
        imageName: Constants.feedBackImage,
        titleText: "Обратная связь"
    )

    private lazy var messageLineView = makeLineView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        configureSubviews()
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        view.backgroundColor = .white
        view.addSubViews(
            profileLabel,
            cardView,
            personalInfoLabel,
            myDataButton,
            inviteFriendButton,
            messageButton,
            myDataLineView,
            inviteFriendLineView,
            messageLineView
        )
        setupMyDataButton()
        view.disableTARMIC()
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            profileLabel.widthAnchor.constraint(equalToConstant: 115),
            profileLabel.heightAnchor.constraint(equalToConstant: 44),
            profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 53),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            cardView.widthAnchor.constraint(equalToConstant: 335),
            cardView.heightAnchor.constraint(equalToConstant: 180),
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            personalInfoLabel.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            personalInfoLabel.heightAnchor.constraint(equalToConstant: 22),
            personalInfoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 328),
            personalInfoLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            ),

            myDataButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            myDataButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),
            myDataButton.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 372
            ),
            myDataButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            ),

            inviteFriendButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            inviteFriendButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),
            inviteFriendButton.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 424
            ),
            inviteFriendButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            ),

            messageButton.widthAnchor.constraint(
                equalToConstant: Constants.Insets.buttonWidth
            ),
            messageButton.heightAnchor.constraint(
                equalToConstant: Constants.Insets.buttonHeight
            ),
            messageButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 476),
            messageButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            ),

            myDataLineView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 403
            ),
            myDataLineView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            ),
            inviteFriendLineView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 455
            ),
            inviteFriendLineView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            ),
            messageLineView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 507
            ),
            messageLineView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.Insets.left
            )
        ])
    }

    private func setupMyDataButton() {
        myDataButton.isUserInteractionEnabled = true
        myDataButton.addTarget(
            self,
            action: #selector(didTapMyDataButton(_:)),
            for: .touchUpInside
        )
    }

    private func makeLineView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(named: "lineView")

        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 2),
            view.widthAnchor.constraint(equalToConstant: 335)
        ])

        return view
    }

    @objc private func didTapMyDataButton(_ sender: UIButton) {
        // soon logic for navigate to my data View
    }
}
