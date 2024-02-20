// Notification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Container for notification
struct Notification {
    let userName: String
    let avatarName: String
    let description: String
    let timePast: String
    let postImage: String
    let type: NotificationType

    enum NotificationType {
        case like
        case subscribe
    }
}
