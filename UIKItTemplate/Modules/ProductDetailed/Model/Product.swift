// Product.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Product with parameters
final class Product {
    // MARK: - Public parameters

    let imageName: String
    var price: Int
    var size: Int
    var isAddedToBasket: Bool = false

    // MARK: - Initialization

    init(imageName: String, cost: Int, size: Int) {
        self.imageName = imageName
        price = cost
        self.size = size
    }
}
