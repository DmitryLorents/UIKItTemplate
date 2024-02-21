// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Adding useful functions to UIVIew
extension UIView {
    // Function to add several subviews separated by comma
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }

    // Disable translatesAutoresizingMaskIntoConstraints for all subviews
    func disableTARMIC() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
}
