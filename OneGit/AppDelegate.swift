//
//  AppDelegate.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController: UINavigationController = UINavigationController()
    var navigator: AppNavigator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.navigator = AppNavigator(navigationViewController: navigationController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        navigator?.navigate(to: .toStartScreen)
        window?.makeKeyAndVisible()
        return true
    }
}

