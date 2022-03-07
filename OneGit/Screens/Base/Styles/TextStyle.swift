//
//  TextStyle.swift
//  OneGit
//
//  Created by Misha Fedorov on 08.03.2022.
//

import Foundation
import UIKit

let logoTextStyle: (UILabel) -> Void = {
    $0.font = .nunitoExtraBold.withSize(36)
    $0.textColor = .applicationPurpleColor
}


let baseTextStyle: (UILabel) -> Void = {
    $0.textColor = .lightPinkTextColor
    $0.font = .nunitoSemiBold
    $0.numberOfLines = 0
    $0.lineBreakMode = .byWordWrapping
}

let titleTextStyle: (UILabel) -> Void = baseTextStyle <> {
    $0.font = .nunitoExtraBold.withSize(36)
}

