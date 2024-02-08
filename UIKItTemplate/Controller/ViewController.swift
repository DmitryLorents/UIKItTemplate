// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
final class ViewController: UIViewController {
    // MARK: - Private Properties

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

    private lazy var topLabel: UILabel = createBoldLabel(text: "Вы ввели слово", yPosition: 106)
    private lazy var bottomLabel = createBoldLabel(
        text: "А вот что получится, если читать справа налево",
        yPosition: 282
    )
    private lazy var topWordLabel = createItalicLabel(yPosition: 163)
    private lazy var bottomWordLabel = createItalicLabel(yPosition: 339)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Private Methods

    private func setViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(startButton)
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(topWordLabel)
        view.addSubview(bottomWordLabel)
    }

    private func createBoldLabel(text: String, yPosition: CGFloat) -> UILabel {
        createLabel(
            text: text,
            color: .black,
            font: UIFont.boldSystemFont(ofSize: 16),
            yPosition: yPosition
        )
    }

    private func createItalicLabel(yPosition: CGFloat) -> UILabel {
        createLabel(
            text: "",
            color: .gray,
            font: .italicSystemFont(ofSize: 16),
            yPosition: yPosition
        )
    }

    private func createLabel(text: String, color: UIColor, font: UIFont, yPosition: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: yPosition, width: 275, height: 57))
        label.text = text
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = .center
        label.center.x = view.center.x
        label.textColor = .black
        label.isHidden = true
        return label
    }
    
    private func showAllLabels(inputText: String) {
        let animationDuration: CGFloat = 0.5
        UIView.animate(withDuration: animationDuration) {
            self.startButton.frame.origin.y = 598
        } completion: { _ in
            UIView.animate(withDuration: animationDuration) {
                self.topLabel.isHidden = false
                self.topWordLabel.text = inputText.capitalized
                self.topWordLabel.isHidden = false
                self.bottomLabel.isHidden = false
                self.bottomWordLabel.text = String(Array(inputText).reversed()).capitalized
                self.bottomWordLabel.isHidden = false
            }
        }
    }

    @objc private func showWordAlert() {
        let alert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let inputText = alert.textFields?.first?.text ?? ""
            self.showAllLabels(inputText: inputText)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
