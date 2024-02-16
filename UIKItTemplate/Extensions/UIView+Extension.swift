// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Adding usefull functions to UIVIew
public extension UIView {
    // Function to add several subviews separated by comma
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }

    // Disable translatesAutoresizingMaskIntoConstraints for all subviews
    func disableTARMIC() {
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    // Function to underline the view
    func underlined() {
        let bottomLayer = CALayer()
        let underlineInset: CGFloat = 8
        bottomLayer.frame = CGRect(x: 0, y: frame.height + underlineInset, width: frame.width, height: 1)
        bottomLayer.backgroundColor = UIColor.separatorApp.cgColor
        layer.addSublayer(bottomLayer)
    }

    // Make label with desired parameters
    static func makeBasketViewLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .left
        label.font = UIFont.makeVerdanaRegular(12)
        label.sizeToFit()
        return label
    }
}
