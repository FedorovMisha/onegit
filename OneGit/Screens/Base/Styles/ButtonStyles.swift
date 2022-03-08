//
//  ButtonStyles.swift
//  OneGit
//
//  Created by Misha Fedorov on 08.03.2022.
//

import Foundation
import UIKit

let baseButtonStyle: (UIButton) -> Void = {
    $0.frame.size.height = 76.0
    $0.layer.cornerCurve = .continuous
    $0.layer.cornerRadius = $0.frame.height / 2
    $0.titleLabel?.font = .nunitoExtraBold.withSize(24)
}

let pinkButtonStyle: (String) -> (UIButton) -> Void = { title in
    return baseButtonStyle <> {
        $0.setTitleColor(.applicationPurpleColor, for: .normal)
        $0.setTitle(title, for: .normal)
        $0.backgroundColor = .lightPinkColor
    }
}
