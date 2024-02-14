// UIView + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension to add several subviews separated by comma
public extension UIView {
    // Function to add several subviews separated by comma
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }

    // Function to underline the view
    func addGrayLineToBottom() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: bounds.height + 10, width: UIScreen.main.bounds.width - 40, height: 1)
        bottomLayer.backgroundColor = UIColor.gray.cgColor
        layer.addSublayer(bottomLayer)
    }
}
