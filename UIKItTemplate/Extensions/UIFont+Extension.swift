// UIFont+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Add fonts, corresponding to app
public extension UIFont {
    /// Makes Verdana bold font with desired size
    /// - Parameter size: Size of font
    static func makeVerdanaBold(_ size: CGFloat) -> UIFont? {
        UIFont(name: "Verdana-bold", size: size)
    }
    /// Makes Verdana regular font with desired size
    /// - Parameter size: Size of font
    static func makeVerdanaRegular(_ size: CGFloat) -> UIFont? {
        UIFont(name: "Verdana", size: size)
    }
}
