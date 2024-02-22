// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions
    ) {
        setupWindow(scene)
    }

    private func setupWindow(_ scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let rootViewController = MainTabBarController()
        let testVC = WebViewController(urlString: "https://www.spacex.com/vehicles/starship/")
        window?.rootViewController = testVC
        window?.makeKeyAndVisible()
    }
}
