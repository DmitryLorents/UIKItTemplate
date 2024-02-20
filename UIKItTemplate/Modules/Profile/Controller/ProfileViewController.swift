// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Страница профиля пользователя
class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Images {
            static let myData = "myData"
            static let inviteFriends = "inviteFriend"
            static let feedBack = "message"
        }

        enum Insets {
            static let left = CGFloat(20)
            static let buttonWidth = CGFloat(183)
            static let buttonHeight = CGFloat(24)
        }

        enum Texts {
            static let profile = "Профиль"
            static let personalInfo = "Личные данные"
            static let myData = "Мои данные"
            static let inviteFriends = "Приведи друга"
            static let feedBack = "Обратная связь"
        }
    }

    // MARK: - Visual Components

    private let cardView = CardView()

    private let personalInfoLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.personalInfo
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()

    private let myDataButton = PersonalButton(
        imageName: Constants.Images.myData,
        title: Constants.Texts.myData
    )

    private lazy var myDataLineView = makeLineView()

    private let inviteFriendButton = PersonalButton(
        imageName: Constants.Images.inviteFriends,
        title: Constants.Texts.inviteFriends
    )

    private lazy var inviteFriendLineView = makeLineView()

    private let messageButton = PersonalButton(
        imageName: Constants.Images.feedBack,
        title: Constants.Texts.feedBack
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
        view.addSubviews(
            cardView,
            personalInfoLabel,
            myDataButton,
            inviteFriendButton,
            messageButton,
            myDataLineView,
            inviteFriendLineView,
            messageLineView
        )
        view.backgroundColor = .systemBackground
        title = Constants.Texts.profile
        view.disableTARMIC()
        setupMyDataButton()
    }

    private func configureSubviews() {
        NSLayoutConstraint.activate([
            cardView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - CGFloat(
                2 * Constants.Insets.left
            )),
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
            myDataLineView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            inviteFriendLineView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 455
            ),
            inviteFriendLineView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),

            messageLineView.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 507
            ),
            messageLineView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
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
        let nextVC = ProfileDetailsViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
