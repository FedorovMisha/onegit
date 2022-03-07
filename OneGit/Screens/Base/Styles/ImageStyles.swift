//
//  ImageStyles.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation
import UIKit

let baseImageStyle: (UIImageView) -> Void = {
    $0.layer.masksToBounds = true
    $0.contentMode = .scaleToFill
}
