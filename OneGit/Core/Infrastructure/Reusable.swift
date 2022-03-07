//
//  Reusable.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation
import UIKit

protocol Reusable {
    static var identifier: String { get }
}

protocol ReusableViewModel: Reusable {
    func configure(any object: Any)
}

protocol TableCellReusableViewModel: ReusableViewModel {
    associatedtype Cell: UITableViewCell
    func configure(cell: Cell)
}

extension TableCellReusableViewModel {
    
    static var identifier: String {
        Cell.identifier
    }
    
    func configure(any object: Any) {
        guard let  cell = object as? Cell else { fatalError("Illegal transformation") }
        self.configure(cell: cell)
    }
}

extension UITableViewCell: Reusable {
    static var identifier: String {
        "\(Self.self)"
    }
}

extension UITableView {
    func cell(for model: ReusableViewModel, indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: type(of: model).identifier,
                                        for: indexPath)
    }
}

