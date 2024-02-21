// Post.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Container for post data
struct Post {
    /// Name of image related to user
    let avatarImageName: String
    /// User name
    let nickName: String
    /// Images related to post
    let imageNames: [String]
    /// Description of post
    let title: String
    /// Post age
    let timeStamp: String
}
