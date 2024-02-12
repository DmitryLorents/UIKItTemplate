// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Screen to play tracks
class PlayerViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var durationSlider: UISlider!

    // MARK: - Public Properties

    var track: Track? = Playlist().tracks[0]

    // MARK: - Private Properties

    private let player = Player()
    private var timer: Timer?

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setOutlets()
        startTimer()
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func shareButtonAction(_ sender: UIButton) {
        print(#function)
    }

    @IBAction func volumeSliderAction(_ sender: UISlider) {
        print(#function)
    }

    @IBAction func durationSliderAction(_ sender: UISlider) {
        print(#function)
    }

    @IBAction func backwardButtonAction(_ sender: Any) {
        player.previousTrack()
    }

    @IBAction func playPauseButtonAction(_ sender: Any) {
        player.playPause()
    }

    @IBAction func forwardButtonAction(_ sender: Any) {
        player.previousTrack()
    }

    // MARK: - Private Methods

    private func setOutlets() {
        coverImageView.layer.cornerRadius = 30
        guard let track else { return }
        coverImageView.image = UIImage(named: track.image)
        trackNameLabel.text = track.name
        artistLabel.text = track.artist
        durationLabel.text = "-\(track.duration)"
        durationSlider.value = 0
        durationSlider.maximumValue = player.playTrack(track.path)
    }

    private func startTimer() {
        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateUI() {
        let (sliderValue, remainingValue) = player.getDurationData()
        durationSlider.value = sliderValue
        durationLabel.text = remainingValue
    }
}
