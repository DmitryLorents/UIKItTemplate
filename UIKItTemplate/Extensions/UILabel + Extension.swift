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
}
