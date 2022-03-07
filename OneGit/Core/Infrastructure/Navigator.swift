//
//  Navigator.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation

protocol Navigator {
    associatedtype Flow
    func navigate(to flow: Flow)
}
