//
//  BaseViewController.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation
import UIKit

enum NavigationBarStyle {
    case hidden
    case open
}

class BaseViewController: UIViewController {
    var navigationBarStyle: NavigationBarStyle = .open {
        didSet {
            switch navigationBarStyle {
            case .open:
                navigationController?.isNavigationBarHidden = false
                break
            case .hidden:
                navigationController?.isNavigationBarHidden = true
            }
        }
    }
}
