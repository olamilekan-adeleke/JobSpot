//
//  AppDelegate.swift
//  JobSpot
//
//  Created by Enigma Kod on 12/08/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        let rootVc = UINavigationController(rootViewController: HomeRecentJobListView())
        window?.rootViewController = rootVc

        UINavigationBar.appearance().tintColor = .black

        // Setup AppSize
        AppSize.shared.setup(width: 375, height: 812)

        return true
    }
}
