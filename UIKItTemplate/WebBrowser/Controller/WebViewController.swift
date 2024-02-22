// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

final class WebViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - Visual Components

    private let webView = WKWebView()
    private let webToolBar = UIToolbar()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(webView, webToolBar)
        view.disableTARMIC()
        setupToolBar()
        setupConstraints()
    }

    private func setupToolBar() {
        let backButton = UIBarButtonItem(systemItem: .rewind)
        let forwardButton = UIBarButtonItem(systemItem: .fastForward)
        let refreshButton = UIBarButtonItem(systemItem: .refresh)
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        let closeButton = UIBarButtonItem(systemItem: .close)

        webToolBar.items = [backButton, forwardButton, refreshButton, flexibleSpace, closeButton]
    }
}

// MARK: - Constraints

private extension WebViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            webToolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webToolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webToolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webToolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),

        ])
    }
}
