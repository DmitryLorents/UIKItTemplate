// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    // MARK: - Constants

    // MARK: - Private Properties

    private var inputString = "" {
        didSet {
            print(inputString)
        }
    }

    private lazy var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 40, height: 44))
        button.center = view.center
        button.backgroundColor = UIColor(named: "customGreenColor")
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(showWordAlert), for: .touchUpInside)
        return button
    }()

    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы ввели слово"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.sizeToFit()
        label.center.x = view.center.x
        label.frame.origin.y = 106
        label.textColor = .black
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Private Methods

    private func setViews() {
        view.backgroundColor = .white // .systemBackground
        view.addSubview(startButton)
        view.addSubview(topLabel)
    }

    @objc private func showWordAlert() {
        let alert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.inputString = alert.textFields?.first?.text ?? ""
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
