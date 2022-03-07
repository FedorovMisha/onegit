//
//  Styling.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation
import UIKit

precedencegroup StylingGroup {
    associativity: left
}

infix operator <>

func <><T: UIView>(_ firstArg: @escaping (T) -> Void,
                   _ secondArg: @escaping (T) -> Void) -> (T) -> Void {
    return {
        firstArg($0)
        secondArg($0)
    }
}

extension UIView {
    static func initWith<T: UIView>(_ style: @escaping (T) -> Void) -> T {
        let view = T()
        style(view)
        return view
    }
}
