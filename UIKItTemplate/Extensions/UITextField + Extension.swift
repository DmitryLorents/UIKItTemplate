// UITextField + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// UITextField extension
extension UITextField {
    // Creates custom textField with desired parameters
    static func createCustomTextField(placeholder: String, yPosition: CGFloat) -> UITextField {
        let textField = UITextField(frame: CGRect(
            x: 20,
            y: yPosition,
            width: UIScreen.main.bounds.width - 40,
            height: 17
        ))
        textField.placeholder = placeholder
        textField.addGrayLineToBottom()
        return textField
    }
}
