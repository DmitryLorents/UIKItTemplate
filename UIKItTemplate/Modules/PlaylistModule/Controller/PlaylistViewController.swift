// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Playlist screen
class PlaylistViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet var coverImageView1: UIImageView!
    @IBOutlet var coverImageView2: UIImageView!
    @IBOutlet var coverImageView3: UIImageView!

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var playlist = Playlist()

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    @IBAction private func playTrack(_ sender: UIButton) {
        print(sender.tag)
        performSegue(withIdentifier: "PlaylistToPlayer", sender: sender)
    }

    // MARK: - Private Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "PlaylistToPlayer" else { return }
        guard let destination = segue.destination as? PlayerViewController else { return }
        guard let sender = sender as? UIButton else { return }
        var track = playlist.tracks[sender.tag - 1]
        destination.track = track
    }

    private func setUI() {
        coverImageView1.layer.cornerRadius = 12
        coverImageView2.layer.cornerRadius = 12
        coverImageView3.layer.cornerRadius = 12
    }
}
