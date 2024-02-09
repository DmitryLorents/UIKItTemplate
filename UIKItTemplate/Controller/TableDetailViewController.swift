// TableDetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
/// Table details screen
final class TableDetailViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet var checkoutButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }

    // MARK: - Private Methods

    private func setViews() {
        checkoutButton.layer.cornerRadius = 12
    }

    // MARK: - IBActions

    @IBAction func checkoutButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.performSegue(withIdentifier: "TableToCheck", sender: nil)
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
