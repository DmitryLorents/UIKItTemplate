// UIFont+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Add fonts, corresponding to app
public extension UIFont {
    static func makeVerdanaBold(_ size: CGFloat) -> UIFont? {
        UIFont(name: "Verdana-bold", size: size)
    }

    static func makeVerdanaRegular(_ size: CGFloat) -> UIFont? {
        UIFont(name: "Verdana", size: size)
    }
}
