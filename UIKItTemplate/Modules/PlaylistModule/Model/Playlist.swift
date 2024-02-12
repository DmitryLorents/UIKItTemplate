// Playlist.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Playlist data
struct Playlist {
    var tracks: [Track]

    init() {
        let path1 = Bundle.main.path(forResource: "Track1", ofType: "mp3")
        let path2 = Bundle.main.path(forResource: "Track2", ofType: "mp3")
        let path3 = Bundle.main.path(forResource: "Track3", ofType: "mp3")
        let track1 = Track(
            image: "cover1",
            artist: "Год змеи",
            name: "Секс и рок-н-ролл",
            duration: "3:02",
            path: path1
        )
        let track2 = Track(image: "cover3.jpg", artist: "Король и Шут", name: "Лесник", duration: "3:12", path: path2)
        let track3 = Track(
            image: "cover2.jpg",
            artist: "Коктейл Шаляпина",
            name: "Метро",
            duration: "3:17",
            path: path3
        )

        tracks = [track1, track2, track3]
    }
}
