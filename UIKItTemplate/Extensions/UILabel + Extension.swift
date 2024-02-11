// UILabel + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension to add custom labels
extension UILabel {
    static func createRedLabel(size: CGFloat, text: String, yPosition: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: yPosition, width: 0, height: 0))
        label.text = text
        label.textColor = UIColor(named: "customRedColor")
        label.font = UIFont(name: "Verdana-bold", size: size)
        label.sizeToFit()
        return label
    }

    static func createBlackVerdana16Label(text: String, origin: CGPoint) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana-bold", size: 16)
        label.sizeToFit()
        label.frame.origin = origin
        return label
    }
}
