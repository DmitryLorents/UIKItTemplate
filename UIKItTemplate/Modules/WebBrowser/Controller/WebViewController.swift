// WebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Screen to show web browser
final class WebViewController: UIViewController {
    // MARK: - Visual Components

    private let webView = WKWebView()
    private let webToolBar = UIToolbar()
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(.closeBig, for: .normal)
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

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
        webView.navigationDelegate = self
        view.addSubviews(webView, webToolBar, closeButton)
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
        let backButton = UIBarButtonItem(
            image: .chevronLeftButton,
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        backButton.isEnabled = false
        let forwardButton = UIBarButtonItem(
            image: .chevronRightButton,
            style: .plain,
            target: self,
            action: #selector(forwardAction)
        )
        forwardButton.isEnabled = false
        let refreshButton = UIBarButtonItem(systemItem: .refresh)
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        refreshButton.action = #selector(refreshAction)
        return [backButton, forwardButton, flexibleSpace, refreshButton]
    }

    private func loadURL() {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func closeViewController() {
        dismiss(animated: true)
    }

    @objc private func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @objc private func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }

    @objc private func refreshAction() {
        webView.reload()
    }
}

// MARK: - Constraints

private extension WebViewController {
    private func setupConstraints() {
        setupWebViewConstraints()
        setupWebToolBarConstraints()
        setupCloseButtonConstraints()
    }

    private func setupWebViewConstraints() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }

    private func setupWebToolBarConstraints() {
        NSLayoutConstraint.activate([
            webToolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webToolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webToolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webToolBar.topAnchor.constraint(equalTo: webView.bottomAnchor),
        ])
    }

    private func setupCloseButtonConstraints() {
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor),
        ])
    }
}

// MARK: - WebViewController: WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    // Enable/disable navigation buttons
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        if let itemsCount = webToolBar.items?.count, itemsCount > 0, let backButton = webToolBar.items?[0] {
            backButton.isEnabled = webView.canGoBack
        }
        if let itemsCount = webToolBar.items?.count, itemsCount > 0, let forwardButton = webToolBar.items?[1] {
            forwardButton.isEnabled = webView.canGoForward
        }
    }
}
