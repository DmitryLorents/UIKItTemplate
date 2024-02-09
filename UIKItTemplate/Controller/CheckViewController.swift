// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CheckViewController: UIViewController {
    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet var totalButton: UIButton!

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Private Methods

    private func setViews() {
        totalButton.layer.cornerRadius = 12
    }

    // MARK: - Private Methods
}
