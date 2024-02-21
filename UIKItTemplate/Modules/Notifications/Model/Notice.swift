// Notice.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Container for notification
struct Notice {
    let userName: String
    let avatarImage: String
    let description: String
    let timePast: String
    let postImage: String
    let type: NoticeType

    enum NoticeType {
        case like
        case subscribe
    }
}
