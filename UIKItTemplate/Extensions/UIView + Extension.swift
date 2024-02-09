// UIView + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension to add several subviews separated by comma
public extension UIView {
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }
}
