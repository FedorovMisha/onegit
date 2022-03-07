//
//  StartScreenViewModel.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation

protocol StartScreenViewModelProtocol {
    func navigateToLogin()
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> ReusableViewModel
}

class StartScreenViewModel: StartScreenViewModelProtocol {

    private let cellViewModels: [ReusableViewModel] = [
        WavesCellViewModel()
    ]
    
    func navigateToLogin() {}
    
    func numberOfRows() -> Int {
        cellViewModels.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ReusableViewModel {
        return cellViewModels[indexPath.row]
    }
}
