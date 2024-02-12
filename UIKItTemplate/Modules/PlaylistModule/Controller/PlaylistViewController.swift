// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Playlist screen
class PlaylistViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setupUI() {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(openTrack(sender:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(openTrack(sender:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(openTrack(sender:)))
        imageView1.addGestureRecognizer(tapGesture1)
        imageView2.addGestureRecognizer(tapGesture2)
        imageView3.addGestureRecognizer(tapGesture3)
    }

    @objc func openTrack(sender: UITapGestureRecognizer) {
        guard let view = sender.view else { return }
        switch view.tag {
        case 1:
            print("1")
        case 2:
            print("2")
        case 3:
            print("3")
        default:
            break
        }
    }
}
