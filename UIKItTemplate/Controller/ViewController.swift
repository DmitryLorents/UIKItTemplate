// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Controller
class ViewController: UIViewController {
    // MARK: - Constants

    let upperViewInset: CGFloat = 55
    let labelHeight: CGFloat = 82

    // MARK: - Private Properties

    private lazy var imageViewBackground: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "backgroundImage")
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var guessNumberButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 82, y: 264, width: 150, height: 150))
        button.isUserInteractionEnabled = true
        button.setTitle("Угадай\nчисло", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "customPurpleColor")
        button.layer.borderColor = UIColor(named: "purpleBorderColor")?.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(guessButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var calculatorButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 132, y: 470, width: 200, height: 200))
        button.isUserInteractionEnabled = true
        button.setTitle("Калькулятор", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(named: "customGreenColor")
        button.layer.borderColor = UIColor(named: "greetingLabelBackgroundColor")?.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 30
        button.addTarget(self, action: #selector(calculatorButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel(frame: CGRect(
            x: 0,
            y: upperViewInset,

            width: UIScreen.main.bounds.width,
            height: labelHeight
        ))
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = UIColor(named: "greetingLabelBackgroundColor")
        label.textColor = .white
        label.layer.borderColor = UIColor(white: 1, alpha: 0.8).cgColor
        label.layer.borderWidth = 3
        label.isHidden = true
        label.text = "Test\ntext"
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showGreetingAlert()
    }

    // MARK: - Private Methods

    private func setViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageViewBackground)
        view.addSubview(guessNumberButton)
        view.addSubview(calculatorButton)
        view.addSubview(greetingLabel)
    }

    private func showGreetingAlert() {
        let alert = UIAlertController(title: "Пожалуйста, представьтесь", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Готово", style: .default) { _ in
            let nameText = alert.textFields?.first?.text ?? "No name"
            self.updateAppearance(nameText)
        }

        alert.addAction(alertAction)
        alert.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }

        present(alert, animated: true)
    }

    @objc private func guessButtonAction() {
        print(#function)
    }

    @objc private func calculatorButtonAction() {
        startCalculatorGame()
    }

    private func updateAppearance(_ nameText: String) {
        UIView.animate(withDuration: 0.3) {
            self.imageViewBackground.frame.origin.y = self.upperViewInset + self.labelHeight
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.greetingLabel.isHidden = false
                self.greetingLabel.text = "Приветствую,\n\(nameText.uppercased())"
            }
        }
    }

    private func startCalculatorGame() {
        let numberAlert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        numberAlert.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        numberAlert.addTextField { textField in
            textField.placeholder = "Число 2"
        }
        let chooseOperationAction = UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            let number1 = Double(numberAlert.textFields?[0].text ?? "0") ?? 0.0
            let number2 = Double(numberAlert.textFields?[1].text ?? "0") ?? 0.0
            self.chooseMathOperation(number1, number2)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        numberAlert.addAction(chooseOperationAction)
        numberAlert.addAction(cancelAction)
        present(numberAlert, animated: true)
    }

    private func chooseMathOperation(_ number1: Double, _ number2: Double) {
        var result = 0.0
        let mathOperationAlert = UIAlertController(
            title: "Выберите математическую операцию",
            message: nil,
            preferredStyle: .alert
        )
        let plusAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            result = number1 + number2
            self.showResult(result: result)
        }
        let minusAction = UIAlertAction(title: "Вычесть", style: .default) { _ in
            result = number1 - number2
            self.showResult(result: result)
        }
        let multiplyAction = UIAlertAction(title: "Умножить", style: .default) { _ in
            result = number1 * number2
            self.showResult(result: result)
        }
        let devideAction = UIAlertAction(title: "Разделить", style: .default) { _ in
            result = number1 / number2
            self.showResult(result: result)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        mathOperationAlert.addAction(plusAction)
        mathOperationAlert.addAction(minusAction)
        mathOperationAlert.addAction(multiplyAction)
        mathOperationAlert.addAction(devideAction)
        mathOperationAlert.addAction(cancelAction)
        present(mathOperationAlert, animated: true)
    }

    private func showResult(result: Double) {
        let resultAlert = UIAlertController(title: "Ваш результат", message: "\(result)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        resultAlert.addAction(cancelAction)
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true)
    }
}
