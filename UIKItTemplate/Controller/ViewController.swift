// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    // MARK: - Constants

    let upperViewInset: CGFloat = 55

    // MARK: - Private Properties

    private var backgroundImageView: UIImageView {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "backgroundImage")
        return imageView
    }

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 82, y: 264, width: 150, height: 150))
        button.isUserInteractionEnabled = true
        button.setTitle("Угадай\nчисло", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "customPurpleColor")
        button.layer.borderColor = UIColor(named: "purpleBorderColor")?.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(guessButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var calculatorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 132, y: 470, width: 200, height: 200))
        button.isUserInteractionEnabled = true
        button.setTitle("Калькулятор", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "customGreenColor")
        button.layer.borderColor = UIColor(named: "greetingLabelBackgroundColor")?.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(calculatorButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: upperViewInset, width: UIScreen.main.bounds.width, height: 82))
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor(named: "greetingLabelBackgroundColor")
        label.textColor = .white
        label.layer.borderColor = UIColor(white: 1, alpha: 0.8).cgColor
        label.layer.borderWidth = 3
        label.text = "Test\ntext"

        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(backgroundImageView)
        view.addSubview(guessNumberButton)
        view.addSubview(calculatorButton)
        view.addSubview(greetingLabel)
    }

    @objc private func guessButtonAction() {
        print(#function)
    }

    @objc private func calculatorButtonAction() {
        print(#function)
    }
}
