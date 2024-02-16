// PersonalButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Шаблон переиспользуемой кнопки личных данных
final class PersonalButton: UIButton {
    var imageName: String?
    var titleText: String?

    // MARK: - Initializers

    init(imageName: String, titleText: String) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.titleText = titleText
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        var config = UIButton.Configuration.plain()

        guard let imageName = imageName,
              let titleText = titleText else { return }

        config.image = UIImage(named: imageName)
        config.imagePlacement = .leading
        config.imagePadding = 8

        config.title = titleText
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 16)
            outgoing.foregroundColor = UIColor.black
            return outgoing
        }
        isUserInteractionEnabled = false
        contentHorizontalAlignment = .left
        configuration = config
    }
}
