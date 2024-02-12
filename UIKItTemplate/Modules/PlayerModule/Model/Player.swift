// Player.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Сlass for controlling music playback
class Player {
    // MARK: - Constants

    // MARK: - Public Properties

    static let shared = Player()

    // MARK: - Private Properties

    private var isPlaying: Bool = false
    private var player = AVAudioPlayer()

    // MARK: - Initializers

    private init() {}

    // MARK: - Public Methods

    public func playTrack(_ path: String?) -> Float {
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: path ?? ""))
        } catch {
            print("Error")
        }
        player.play()
        return Float(player.duration)
    }

    public func stop() {
        player.stop()
    }

    public func getDurationData() -> (sliderValue: Float, remainingTime: String) {
        let sliderValue = Float(player.currentTime)
        let remainingTime = getRemainingTime()
        return (sliderValue, remainingTime)
    }

    public func playPause() -> Bool {
        let _: Any = (player.isPlaying) ? player.pause() : player.play()
        return player.isPlaying
    }

    public func nextTrack() {
        print(#function)
    }

    public func previousTrack() {
        print(#function)
    }

    // MARK: - Private Methods

    private func getRemainingTime() -> String {
        let time = Int(player.duration - player.currentTime + 0.5)
        let min = time / 60
        let sec = time % 60
        return String(format: "%02d:%02d", min, sec)
    }
}

/// ttr
class ViewController: UIViewController {
    @IBOutlet var albumNameLabel: UILabel!
    @IBOutlet var trackImage: UIImageView!
    @IBOutlet var artistLabel: UILabel!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var pauseButton: UIImageView!
    @IBOutlet var playButton: UIImageView!
    @IBOutlet var sliderDuration: UISlider!
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var remainingtimeLabel: UILabel!
    @IBOutlet var previousTrackButton: UIImageView!
    @IBOutlet var nextTrackButton: UIImageView!

    var player = AVAudioPlayer()
    let ncObserver = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
//        ncObserver.addObserver(
//            self,
//            selector: #selector(updateViewData),
//            name: Notification.Name("UpdateViewData"),
//            object: nil
//        )
        trackImage.layer.cornerRadius = 20

        currentTimeLabel.text = currentTime()
        remainingtimeLabel.text = remainingTime()

        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: ""))
        } catch {
            print("Error")
        }

        sliderDuration.maximumValue = Float(player.duration)
        Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(updateTiming),
            userInfo: nil,
            repeats: true
        )

        // make interaction for pause button
        let tapPause = UITapGestureRecognizer(target: self, action: #selector(pausePressed))
        pauseButton.addGestureRecognizer(tapPause)

        let tapPlay = UITapGestureRecognizer(target: self, action: #selector(playPressed))
        playButton.addGestureRecognizer(tapPlay)

        let tapTrackImage = UITapGestureRecognizer(target: self, action: #selector(trackImagePressed))
        trackImage.addGestureRecognizer(tapTrackImage)

        sliderDuration.addTarget(self, action: #selector(changeTiming), for: .valueChanged)
    }

//    @objc func nextTrackPressed() {
//        player.pause()
//        if currentTrackID == 2 {
//            currentTrackID = 0
//        } else {
//            currentTrackID += 1
//        }
//        updateViewData()
//    }

//    @objc func prevTrackPressed() {
//        player.pause()
//        if currentTrackID == 0 {
//            currentTrackID = 2
//        } else {
//            currentTrackID -= 1
//        }
//
//        updateViewData()
//    }

    @objc func changeTiming() {
        player.currentTime = Double(sliderDuration.value)
    }

    @objc func pausePressed() {
        if player.isPlaying {
            player.pause()
            pauseButton.isHidden = true
            playButton.isHidden = false
        }
    }

    @objc func playPressed() {
        if !player.isPlaying {
            player.play()
            playButton.isHidden = true
            pauseButton.isHidden = false
        }
    }

    @objc func trackImagePressed() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PlaylistVCIdentifier")
        present(vc, animated: true)
    }

    func currentTime() -> String {
        let time = Int(player.currentTime + 0.5)
        let min = time / 60
        let sec = time % 60
        return String(format: "%02d:%02d", min, sec)
    }

    func remainingTime() -> String {
        let time = Int(player.duration - player.currentTime + 0.5)
        let min = time / 60
        let sec = time % 60
        return String(format: "%02d:%02d", min, sec)
    }

    @objc func updateTiming() {
        sliderDuration.value = Float(player.currentTime)
        currentTimeLabel.text = currentTime()
        remainingtimeLabel.text = remainingTime()
    }

//    @objc func updateViewData() {
//        trackImage.image = playlist[currentTrackID].image
//        trackImage.layer.cornerRadius = 20
//
//        currentTimeLabel.text = currentTime()
//        remainingtimeLabel.text = remainingTime()
//
//        do {
//            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: playlist[currentTrackID].path!))
//        } catch {
//            print("Error")
//        }
//
//        albumNameLabel.text = playlist[currentTrackID].album
//        artistLabel.text = playlist[currentTrackID].artist
//        trackNameLabel.text = playlist[currentTrackID].name
//
//        sliderDuration.maximumValue = Float(player.duration)
//        player.play()
//        pauseButton.isHidden = false
//        playButton.isHidden = true
//    }
}
