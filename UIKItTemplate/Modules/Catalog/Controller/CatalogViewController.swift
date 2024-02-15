// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        enum Text {
            static let title = "Каталог"
            static let newItems = "Новинки"
            static let sale = "Распродажа"
            static let brands = "Бренды"
            static let shoes = "Обувь"
            static let bags = "Сумки"
        }

        enum Fonts {
            static let verdanaBold14 = UIFont.makeVerdanaBold14()
        }

        enum ImageName {
            static let newItemsWoman = "newItemsWoman"
            static let saleWoman = "saleWoman"
            static let newItemsMan = "newItemsMan"
            static let saleMan = "saleMan"
            static let newItemsChild = "newItemsChild"
            static let saleChild = "saleChild"
            static let brands = "brands"
            static let bagChild = "bagChild"
            static let bagMan = "bagMan"
            static let bagWoman = "bagWoman"
            static let basketBuy = "basketBuy"
            static let camera = "camera"
            static let qr = "qr"
            static let shoesChild = "shoesChild"
            static let shoesMan = "shoesMan"
            static let shoesWoman = "shoesWoman"
        }

        enum BuyerType: String, CaseIterable {
            case woman = "Женщинам"
            case man = "Мужчинам"
            case child = "Детям"
        }

        enum Size {
            static let generalInset: CGFloat = 20
            static let topInset: CGFloat = 25
            static var segmentedControlHeight: CGFloat = 44
            static let categoryImageRatio: CGFloat = 120.0 / 160.0
            static let categoryViewHeight: CGFloat = 80
        }
    }

    // MARK: - Visual Components

    private lazy var buyerTypeSegmentedControl: UISegmentedControl = {
        let types = Array(Constants.BuyerType.allCases).map(\.rawValue)
        let view = UISegmentedControl(items: types)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(updateState(sender:)), for: .valueChanged)
        return view
    }()

    private lazy var newItemsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageName.newItemsWoman)
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var salesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.ImageName.saleWoman)
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var newItemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.Text.newItems
        label.textAlignment = .center
        label.font = Constants.Fonts.verdanaBold14
        label.sizeToFit()
        return label
    }()

    private lazy var salesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.Text.sale
        label.textAlignment = .center
        label.font = Constants.Fonts.verdanaBold14
        label.sizeToFit()
        return label
    }()

    private lazy var brandView = CategoryView(title: Constants.Text.brands, imageName: Constants.ImageName.brands)
    private lazy var shoesView = CategoryView(title: Constants.Text.shoes, imageName: Constants.ImageName.shoesWoman)
    private lazy var bagView = CategoryView(title: Constants.Text.bags, imageName: Constants.ImageName.bagWoman)

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var state: Constants.BuyerType = .woman {
        didSet {
            updateUIAccording(state: state)
        }
    }

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        configureBackButton()
        addBarButtons()
        setConstraints()
    }

    // MARK: - Private Methods

    private func setUI() {
        title = Constants.Text.title
        navigationController?.view.tintColor = .black
        view.addSubviews(
            buyerTypeSegmentedControl,
            newItemsImageView,
            newItemLabel,
            salesImageView,
            salesLabel,
            brandView,
            shoesView,
            bagView
        )
        view.disableTARMIC()
        setBagViewAction()
    }

    private func setBagViewAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openProductDetailedVC))
        bagView.addGestureRecognizer(tapGesture)
        bagView.isUserInteractionEnabled = true
    }

    private func addBarButtons() {
        let cameraImage = UIImage(named: Constants.ImageName.camera)
        let cameraButton = UIBarButtonItem(
            image: cameraImage,
            style: .plain, target: self,
            action: #selector(takePicture)
        )
        let qrImage = UIImage(named: Constants.ImageName.qr)
        let qrButton = UIBarButtonItem(
            image: qrImage,
            style: .plain, target: self,
            action: #selector(scanQR)
        )
        navigationItem.setRightBarButtonItems([qrButton, cameraButton], animated: true)
    }

    private func configureBackButton() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    @objc private func takePicture() {
        print(#function)
    }

    @objc private func scanQR() {
        print(#function)
    }

    @objc func openProductDetailedVC() {
        let productDetailedVC = ProductDetailedViewController()
        navigationController?.pushViewController(productDetailedVC, animated: true)
    }

    @objc private func updateState(sender: UISegmentedControl) {
        let segmentIndex = sender.selectedSegmentIndex
        guard let newState = Constants.BuyerType(rawValue: sender.titleForSegment(at: segmentIndex) ?? "")
        else { return }
        state = newState
    }
}

// Set constraints
private extension CatalogViewController {
    func setConstraints() {
        let inset = Constants.Size.generalInset
        NSLayoutConstraint.activate([
            buyerTypeSegmentedControl.heightAnchor.constraint(equalToConstant: Constants.Size.segmentedControlHeight),
            buyerTypeSegmentedControl.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Size.topInset
            ),
            buyerTypeSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            buyerTypeSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),

            newItemsImageView.topAnchor.constraint(equalTo: buyerTypeSegmentedControl.bottomAnchor, constant: inset),
            newItemsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            newItemsImageView.heightAnchor.constraint(
                equalTo: newItemsImageView.widthAnchor,
                multiplier: Constants.Size.categoryImageRatio
            ),

            salesImageView.topAnchor.constraint(equalTo: newItemsImageView.topAnchor),
            salesImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            salesImageView.leadingAnchor.constraint(equalTo: newItemsImageView.trailingAnchor, constant: inset),
            salesImageView.heightAnchor.constraint(equalTo: newItemsImageView.heightAnchor),

            newItemLabel.topAnchor.constraint(equalTo: newItemsImageView.topAnchor),
            newItemLabel.centerXAnchor.constraint(equalTo: newItemsImageView.centerXAnchor),

            salesLabel.bottomAnchor.constraint(equalTo: salesImageView.bottomAnchor),
            salesLabel.centerXAnchor.constraint(equalTo: salesImageView.centerXAnchor),

            brandView.topAnchor.constraint(equalTo: newItemsImageView.bottomAnchor, constant: inset),
            brandView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            brandView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
            brandView.heightAnchor.constraint(equalToConstant: Constants.Size.categoryViewHeight),

            shoesView.topAnchor.constraint(equalTo: brandView.bottomAnchor, constant: inset),
            shoesView.leadingAnchor.constraint(equalTo: brandView.leadingAnchor),
            shoesView.trailingAnchor.constraint(equalTo: brandView.trailingAnchor),
            shoesView.heightAnchor.constraint(equalTo: brandView.heightAnchor),

            bagView.topAnchor.constraint(equalTo: shoesView.bottomAnchor, constant: inset),
            bagView.leadingAnchor.constraint(equalTo: brandView.leadingAnchor),
            bagView.trailingAnchor.constraint(equalTo: brandView.trailingAnchor),
            bagView.heightAnchor.constraint(equalTo: brandView.heightAnchor)

        ])
    }
}

// MARK: - Update UI components depending on view state

extension CatalogViewController {
    private func updateUIAccording(state: Constants.BuyerType) {
        let newItems: String
        let sale: String
        let shoes: String
        let bag: String
        switch state {
        case .child:
            newItems = Constants.ImageName.newItemsChild
            sale = Constants.ImageName.saleChild
            shoes = Constants.ImageName.shoesChild
            bag = Constants.ImageName.bagChild
        case .man:
            newItems = Constants.ImageName.newItemsMan
            sale = Constants.ImageName.saleMan
            shoes = Constants.ImageName.shoesMan
            bag = Constants.ImageName.bagMan
        case .woman:
            newItems = Constants.ImageName.newItemsWoman
            sale = Constants.ImageName.saleWoman
            shoes = Constants.ImageName.shoesWoman
            bag = Constants.ImageName.bagWoman
        }
        newItemsImageView.image = UIImage(named: newItems)
        salesImageView.image = UIImage(named: sale)
        shoesView.setImage(image: shoes)
        bagView.setImage(image: bag)
    }
}
