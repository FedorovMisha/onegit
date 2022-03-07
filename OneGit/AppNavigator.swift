//
//  AppNavigator.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation
import UIKit

class AppNavigator: Navigator {
    enum Flow {
        case toStartScreen
    }

    private let navigationViewController: UINavigationController

    init(navigationViewController: UINavigationController) {
        self.navigationViewController = navigationViewController
    }

    func navigate(to flow: Flow) {
        switch flow {
        case .toStartScreen:
            let controller = ViewControllerFactory.shared.createStartScreenViewController()
            navigationViewController.setViewControllers([controller], animated: true)
        }
    }

}
