// Notice.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Container for notification
struct Notice {
    /// Name of user
    let userName: String
    /// Name of user's image
    let avatarImage: String
    /// Notification text
    let description: String
    /// Notice age
    let timePast: String
    /// Name of image related to commented post
    let postImage: String
    /// type of notice
    let type: NoticeType

    /// Notice types
    enum NoticeType {
        /// Notice that somebody likes your post
        case like
        /// Notice to subscribe on somebody
        case subscribe
    }
}
