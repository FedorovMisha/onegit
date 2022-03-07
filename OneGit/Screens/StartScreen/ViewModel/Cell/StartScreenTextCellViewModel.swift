//
//  StartScreenTextCellViewModel.swift
//  OneGit
//
//  Created by Misha Fedorov on 08.03.2022.
//

import Foundation

class StartScreenTextCellViewModel: TableCellReusableViewModel {
    
    let model: StartScreenTextCell.Model

    init(model: StartScreenTextCell.Model) {
        self.model = model
    }
    
    func configure(cell: StartScreenTextCell) {
        cell.configure(with: model)
    }
}
