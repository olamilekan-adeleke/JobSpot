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

        let rootVc = UINavigationController(rootViewController: OnBoardingVC())
//        rootVc.navigationController?. = .fullScreen
        window?.rootViewController = rootVc

        return true
    }
}
