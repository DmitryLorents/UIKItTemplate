// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Screen with detailed information for зкщвгсеы
final class BasketViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Inset {
            static let topInset: CGFloat = 19
            static let generalInset: CGFloat = 20
        }

        enum Text {
            static let title = "Корзина"
        }

        enum Font {
            static let verdanaBold16 = UIFont.makeVerdanaBold(16)
        }
    }

    // MARK: - Visual Components

    private lazy var productView = ProductDetailedView(product: defaultProduct)
    private lazy var basketView = BasketView(product: defaultProduct)
    private lazy var emptyBasketLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша корзина пуста"
        label.textAlignment = .center
        label.font = Constants.Font.verdanaBold16
        return label
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    private let storage = ProductStorage.shared
    private var defaultProduct: Product {
        storage.products[0]
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateOrderedProducts()
    }

    // MARK: - Private Methods

    private func setUI() {
        title = Constants.Text.title
        view.addSubviews(emptyBasketLabel, basketView, productView)
//        updateOrderedProducts()
        view.disableTARMIC()
        setDelegates()
    }

    private func updateOrderedProducts() {
        print(#function)
        guard let product = storage.getOrderedProducts().first else {
            updateUIState(basketIsEmpty: true)
            return
        }
        productView.removeFromSuperview()
        basketView.removeFromSuperview()
        productView = ProductDetailedView(product: product)
        basketView = BasketView(product: product)
        view.addSubviews(productView, basketView)
        view.disableTARMIC()
        setConstraints()
        updateUIState(basketIsEmpty: false)
        setDelegates()
    }

    private func updateUIState(basketIsEmpty: Bool) {
        productView.isHidden = basketIsEmpty
        basketView.isHidden = basketIsEmpty
        emptyBasketLabel.isHidden = !basketIsEmpty
    }

    private func setDelegates() {
        view.subviews.forEach {
            guard let subView = $0 as? ProductDetailedView else { return }
            subView.delegate = self
        }
    }
}

// Set constraints
private extension BasketViewController {
    func setConstraints() {
        let inset = Constants.Inset.generalInset
        NSLayoutConstraint.activate([
            productView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            productView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Inset.topInset
            ),
            productView.heightAnchor.constraint(equalTo: productView.widthAnchor, multiplier: 1),

            basketView.leadingAnchor.constraint(equalTo: productView.trailingAnchor, constant: inset),
            basketView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            basketView.topAnchor.constraint(equalTo: productView.topAnchor),
            basketView.heightAnchor.constraint(equalTo: productView.heightAnchor, multiplier: 1),
            basketView.heightAnchor.constraint(equalTo: basketView.widthAnchor),

            emptyBasketLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyBasketLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension BasketViewController: ProductDetailedViewDelegate {
    func chooseSizeFor(product: Product) {
        product.isAddedToBasket = false
        updateOrderedProducts()
    }
}
