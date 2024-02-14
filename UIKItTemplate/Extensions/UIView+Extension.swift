//
//  UIView+Extension.swift
//  UIKItTemplate
//
//  Created by Dmitry on 14.02.2024.
//

import UIKit
/// Adding usefull functions to UIVIew
public extension UIView {
    
    // Function to add several subviews separated by comma
    func addSubViews(_ subviews: UIView...) {
        subviews.forEach { self.addSubview($0) }
    }
}
