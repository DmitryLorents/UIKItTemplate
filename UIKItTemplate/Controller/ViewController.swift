// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Private Properties

    private var backgroundImageView: UIImageView {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "backgroundImage")
        return imageView
    }

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 150, height: 150))
        button.isUserInteractionEnabled = true
        button.setTitle("Угадай число", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple // UIColor(red: 155, green: 127, blue: 181, alpha: 1)
        button.layer.borderColor = UIColor.black.cgColor // UIColor(red: 76, green: 36, blue: 115, alpha: 1).cgColor
        button.layer.borderWidth = 3
        // button.addTarget(self, action: #selector(guessButtonAction), for: .touchUpInside)
        print("Button created")
        return button
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
        backgroundImageView.addSubview(guessNumberButton)
    }

    @objc private func guessButtonAction() {
        print(#function)
    }
}
