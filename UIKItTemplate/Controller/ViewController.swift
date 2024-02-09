// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    // MARK: - Constants

    private lazy var birthdayImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 70, width: 125, height: 125))
        imageView.center.x = view.center.x
        imageView.image = UIImage(named: "birthdayLogoImage")
        return imageView
    }()

    // MARK: - IBOutlets

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(birthdayImageView)
    }
}
