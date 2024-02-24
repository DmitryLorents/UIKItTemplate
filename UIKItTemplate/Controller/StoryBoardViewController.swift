// StoryBoardViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to show how storyboards constraints are working
class StoryBoardViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!

    // MARK: - Life Cycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        roundSubViews()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        roundSubViews()
    }

    // MARK: - Private Methods

    private func roundSubViews() {
        print(#function)
        print(redView.frame.width)
        print(redView.layer.cornerRadius)
        redView.layer.cornerRadius = redView.frame.width / 4
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
    }
}
