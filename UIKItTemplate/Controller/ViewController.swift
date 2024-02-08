// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Private Properties

    private lazy var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 44))
        button.center = view.center
        button.backgroundColor = UIColor(named: "customGreenColor")
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(showWordAlert), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Private Methods

    private func setViews() {
        view.backgroundColor = .white // .systemBackground
        view.addSubview(startButton)
    }

    @objc private func showWordAlert() {
        print(#function)
    }
}
