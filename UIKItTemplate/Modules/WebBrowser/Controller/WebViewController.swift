// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Screen to show web browser
final class WebViewController: UIViewController {
    
    // MARK: - Visual Components

    private let webView = WKWebView()
    private let webToolBar = UIToolbar()

    // MARK: - Private Properties

    private let urlString: String

    // MARK: - Initializers

    init(urlString: String) {
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadURL()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubviews(webView, webToolBar)
        view.disableTARMIC()
        setupToolBar()
        setupConstraints()
    }

    private func setupToolBar() {
        webToolBar.items = makeToolBarButtons()
        webToolBar.tintColor = .black
    }

    private func makeToolBarButtons() -> [UIBarButtonItem] {
        // Buttons
        let backButton = UIBarButtonItem(systemItem: .rewind)
        let forwardButton = UIBarButtonItem(systemItem: .fastForward)
        let refreshButton = UIBarButtonItem(systemItem: .refresh)
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        let closeButton = UIBarButtonItem(systemItem: .close)
        // Actions
        closeButton.action = #selector(closeViewController)
        
        return [backButton, forwardButton, refreshButton, flexibleSpace, closeButton]
    }

    private func loadURL() {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func closeViewController() {
        dismiss(animated: true)
    }
}

// MARK: - Constraints

private extension WebViewController {
    private func setupConstraints() {
        setupWebViewConstraints()
        setupwebToolBarConstraints()
    }

    private func setupWebViewConstraints() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    private func setupwebToolBarConstraints() {
        NSLayoutConstraint.activate([
            webToolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webToolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webToolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webToolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),
        ])
    }
}
