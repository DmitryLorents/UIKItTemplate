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
            static let buttonHeight: CGFloat = 44
        }

        enum Text {
            static let title = "Корзина"
        }

        enum Font {
            static let verdanaBold16 = UIFont.makeVerdanaBold(16)
        }
    }

    // MARK: - Visual Components

    //    private lazy var productView = ProductDetailedView(product: defaultProduct)
    private lazy var basketView = BasketView(product: defaultProduct)
    private lazy var emptyBasketLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша корзина пуста"
        label.textAlignment = .center
        label.font = Constants.Font.verdanaBold16
        return label
    }()

    private lazy var checkoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("title", for: .normal)
        button.backgroundColor = .magentaApp
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.makeVerdanaBold(16)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(checkoutButtonAction), for: .touchUpInside)
        return button
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
        view.addSubviews(emptyBasketLabel, basketView, checkoutButton)
        view.disableTARMIC()
        setDelegates()
    }

    private func updateOrderedProducts() {
        guard let product = storage.getOrderedProducts().first else {
            updateUIState(basketIsEmpty: true)
            return
        }
        basketView.removeFromSuperview()
        basketView = BasketView(product: product)
        basketView.delegate = self
        setCheckoutButtonLabel(for: product)
        view.addSubview(basketView)
        view.disableTARMIC()
        setConstraints()
        updateUIState(basketIsEmpty: false)
        setDelegates()
    }

    private func updateUIState(basketIsEmpty: Bool) {
        basketView.isHidden = basketIsEmpty
        checkoutButton.isHidden = basketIsEmpty
        emptyBasketLabel.isHidden = !basketIsEmpty
    }

    private func setDelegates() {
        for subview in view.subviews {
            subview.subviews.forEach {
                guard let subView = $0 as? ProductDetailedView else { return }
                subView.delegate = self
            }
        }
    }

    private func setCheckoutButtonLabel(for product: Product) {
        let title = "Оформить заказ - \(product.price * product.amount) ₽"
        checkoutButton.setTitle(title, for: .normal)
    }

    @objc private func checkoutButtonAction() {
        didTapBasketButton(product: storage.getOrderedProducts()[0])
    }
}

// Set constraints
private extension BasketViewController {
    func setConstraints() {
        let inset = Constants.Inset.generalInset
        NSLayoutConstraint.activate([
            basketView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset),
            basketView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            basketView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),

            emptyBasketLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyBasketLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -34),
            checkoutButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Inset.generalInset
            ),
            checkoutButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.Inset.generalInset
            ),
            checkoutButton.heightAnchor.constraint(equalToConstant: Constants.Inset.buttonHeight)

        ])
    }
}

extension BasketViewController: ProductDetailedViewDelegate {
    func didTapBasketButton(product: Product) {
        product.isAddedToBasket = false
        product.amount = 1
        updateOrderedProducts()
    }
}

extension BasketViewController: BasketViewDelegate {
    func didChangeProductAmount(product: Product) {
        setCheckoutButtonLabel(for: product)
    }
}
