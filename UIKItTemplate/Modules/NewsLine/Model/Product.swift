// Product.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Product with parameters
final class Product {
    // MARK: - Public parameters

    let name: String
    let imageName: String
    var price: Int
    var size: Int
    var isAddedToBasket: Bool = false
    var amount = 1

    // MARK: - Initialization

    init(name: String, imageName: String, cost: Int, size: Int) {
        self.name = name
        self.imageName = imageName
        price = cost
        self.size = size
    }
}
