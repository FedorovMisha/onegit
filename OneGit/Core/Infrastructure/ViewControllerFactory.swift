//
//  ViewControllerFactory.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation

protocol ViewControllerFactoryProtocol {
    static var shared: ViewControllerFactoryProtocol { get set }
    func createStartScreenViewController() -> StartScreenViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {

    static var shared: ViewControllerFactoryProtocol = ViewControllerFactory()
    
    func createStartScreenViewController() -> StartScreenViewController {
        let viewModel = StartScreenViewModel()
        let controller = StartScreenViewController(viewModel)
        return controller
    }
}
