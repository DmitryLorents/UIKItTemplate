// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
/// Checkout screen
final class CheckViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var totalButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Private Methods

    private func setViews() {
        totalButton.layer.cornerRadius = 12
    }
}
