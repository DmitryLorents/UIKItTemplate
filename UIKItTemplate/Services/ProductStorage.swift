// ProductStorage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Database with product and their parameters
final class ProductStorage {
    // MARK: - Public Properties

    static let sizes = Array(35 ... 39)
    static let shared = ProductStorage()

    // MARK: - Private Properties

    private let womanBlackShoes = Product(
        name: "Женские ботинки",
        imageName: "womanBlackShoes",
        cost: 2250,
        size: ProductStorage.sizes.first ?? 0
    )
    private let manBlackShoes = Product(
        name: "Мужские ботинки",
        imageName: "manBlackShoes",
        cost: 4250,
        size: ProductStorage.sizes[0]
    )
    private let runningShoes = Product(
        name: "Кроссовки",
        imageName: "runningShoes",
        cost: 5750,
        size: ProductStorage.sizes[0]
    )
    private let womanYellowShoes = Product(
        name: "Женские туфли", imageName: "womanYellowShoes",
        cost: 3500,
        size: ProductStorage.sizes[0]
    )
    private let sneakers = Product(name: "Кеды", imageName: "sneakers", cost: 5750, size: ProductStorage.sizes[0])

    var products: [Product] {
        [womanBlackShoes, manBlackShoes, runningShoes, womanYellowShoes, sneakers]
    }

    // MARK: - Initializers

    private init() {}

    // MARK: - Public functions

    func getOrderedProducts() -> [Product] {
        for product in products where product.isAddedToBasket {
            // TODO: - Create correct choosing
            return [product]
        }
        return []
    }

    // MARK: - Private Methods
}
