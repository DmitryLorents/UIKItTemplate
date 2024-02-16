// BasketView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// protocol ProductDetailedViewDelegate: AnyObject {
//    func chooseSizeFor(product: Product)
// }

/// View to show product with price
final class BasketView: UIView {
    // MARK: - Constants

    private enum Constants {
        enum Size {
            static let basketButtonSideInset: CGFloat = 4
            static let generalInset: CGFloat = 12
            static let cornerRadius: CGFloat = 7
            static let smallButtonSize: CGFloat = 15
            static let bigButtonHeight: CGFloat = 17
            static let maxProductlQuantity = 9
            static let sizeButtonLeadingInset: CGFloat = 7
            static let interButtonInset: CGFloat = 4
        }

        enum Image {
            static let basketGray = "basketGray"
            static let basketTinted = "basketTinted"
        }

        enum Text {
            static let quantity = "Количество"
            static let size = "Размер"
            static let price = "Цена"
            static let currency = " ₽"
            static let minus = "-"
            static let plus = "+"
        }

        enum Font {
            static let verdana12 = UIFont.makeVerdanaRegular(12)
            static let verdana10 = UIFont.makeVerdanaRegular(10)
            static let verdanaBold10 = UIFont.makeVerdanaBold(10)
        }
    }

    // MARK: - Visual Components

    private lazy var productDetailedView = ProductDetailedView(product: product, isPreceHidden: true)
    private let viewForCostraints = UIView()
    private lazy var nameLabel = UIView.makeBasketViewLabel(text: product.name)
    private lazy var quantityLabel = UIView.makeBasketViewLabel(text: Constants.Text.quantity)
    private lazy var quantityValueLabel = UIView.makeBasketViewLabel(text: " \(productQuantity) ")
    private lazy var sizeLabel = UIView.makeBasketViewLabel(text: Constants.Text.size)
    private lazy var priceLabel = UIView.makeBasketViewLabel(text: Constants.Text.price)
    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(product.price)\(Constants.Text.currency)"
        label.textAlignment = .right
        label.font = Constants.Font.verdanaBold10
        label.sizeToFit()
        return label
    }()

    private lazy var minusButton = makelightPinkCapsuledButton(title: Constants.Text.minus)
    private lazy var plusButton = makelightPinkCapsuledButton(title: Constants.Text.plus)
    private let sizeButtonsView = UIView()

    // MARK: - Public Properties

    weak var delegate: ProductDetailedViewDelegate?

    // MARK: - Private Properties

    private let product: Product
    private var productQuantity = 1

    // MARK: - Initializers

    init(product: Product) {
        self.product = product
        super.init(frame: .zero)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        sizeButtonsView.backgroundColor = .systemMint
        addSubviews(productDetailedView, viewForCostraints)
        viewForCostraints.addSubviews(
            nameLabel,
            quantityLabel,
            sizeLabel,
            priceLabel,
            priceValueLabel,
            minusButton,
            plusButton,
            quantityValueLabel,
            sizeButtonsView
        )
        viewForCostraints.disableTARMIC()

        disableTARMIC()
        setConstraints()
        setButtonsAction()
    }

    private func setButtonsAction() {
        plusButton.addTarget(self, action: #selector(changeQuantity(sender:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(changeQuantity(sender:)), for: .touchUpInside)
    }

    @objc func changeQuantity(sender: UIButton) {
        print(#function)
        switch sender.currentTitle {
        case Constants.Text.minus:
            productQuantity -= 1
        case Constants.Text.plus:
            productQuantity += 1
        default:
            break
        }
        if productQuantity == 0 {
            productQuantity = 1
        }
        if productQuantity > Constants.Size.maxProductlQuantity {
            productQuantity = Constants.Size.maxProductlQuantity
        }
        quantityValueLabel.text = " \(productQuantity) "
    }
}

// MARK: - Set constraints

private extension BasketView {
    func setConstraints() {
        let inset = Constants.Size.generalInset
        NSLayoutConstraint.activate([
            productDetailedView.topAnchor.constraint(equalTo: topAnchor),
            productDetailedView.bottomAnchor.constraint(equalTo: bottomAnchor),
            productDetailedView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            productDetailedView.heightAnchor.constraint(equalTo: productDetailedView.widthAnchor),

            viewForCostraints.topAnchor.constraint(equalTo: topAnchor),
            viewForCostraints.bottomAnchor.constraint(equalTo: bottomAnchor),
            viewForCostraints.leadingAnchor.constraint(equalTo: productDetailedView.trailingAnchor, constant: inset),
            viewForCostraints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            viewForCostraints.heightAnchor.constraint(equalTo: viewForCostraints.widthAnchor),
            viewForCostraints.heightAnchor.constraint(equalTo: productDetailedView.heightAnchor),

            priceLabel.leadingAnchor.constraint(equalTo: viewForCostraints.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: viewForCostraints.bottomAnchor),

            priceValueLabel.trailingAnchor.constraint(equalTo: viewForCostraints.trailingAnchor),
            priceValueLabel.bottomAnchor.constraint(equalTo: viewForCostraints.bottomAnchor),

            sizeLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            // TODO: - Set correct constraint
            sizeLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -inset * 3),

            quantityLabel.bottomAnchor.constraint(equalTo: sizeLabel.topAnchor, constant: -inset),
            quantityLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),

            nameLabel.bottomAnchor.constraint(equalTo: quantityLabel.topAnchor, constant: -inset),
            nameLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),

            plusButton.trailingAnchor.constraint(equalTo: viewForCostraints.trailingAnchor, constant: -inset),
            plusButton.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            plusButton.heightAnchor.constraint(equalToConstant: Constants.Size.smallButtonSize),
            plusButton.widthAnchor.constraint(equalToConstant: Constants.Size.smallButtonSize),

            quantityValueLabel.bottomAnchor.constraint(equalTo: quantityLabel.bottomAnchor),
            quantityValueLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor),

            minusButton.trailingAnchor.constraint(equalTo: quantityValueLabel.leadingAnchor),
            minusButton.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            minusButton.heightAnchor.constraint(equalToConstant: Constants.Size.smallButtonSize),
            minusButton.widthAnchor.constraint(equalToConstant: Constants.Size.smallButtonSize),

            sizeButtonsView.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            sizeButtonsView.trailingAnchor.constraint(equalTo: viewForCostraints.trailingAnchor),
            sizeButtonsView.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: inset),
            sizeButtonsView.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -inset)

        ])
    }
}

// Make capsuled button with lightPinkColor
extension BasketView {
    private func makelightPinkCapsuledButton(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightPinkApp
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = UIFont.makeVerdanaRegular(10)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = Constants.Size.cornerRadius
        return button
    }
}
