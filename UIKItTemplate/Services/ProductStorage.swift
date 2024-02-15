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
        imageName: "womanBlackShoes",
        cost: 2250,
        size: ProductStorage.sizes.first ?? 0
    )
    private let manBlackShoes = Product(imageName: "manBlackShoes", cost: 4250, size: ProductStorage.sizes[0])
    private let runningShoes = Product(imageName: "runningShoes", cost: 5750, size: ProductStorage.sizes[0])
    private let womanYellowShoes = Product(
        imageName: "womanYellowShoes",
        cost: 3500,
        size: ProductStorage.sizes[0]
    )
    private let sneakers = Product(imageName: "sneakers", cost: 5750, size: ProductStorage.sizes[0])

    var products: [Product] {
        [womanBlackShoes, manBlackShoes, runningShoes, womanYellowShoes, sneakers]
    }

    // MARK: - Initializers

    private init() {}

    // MARK: - IBAction

    // MARK: - Private Methods
}
