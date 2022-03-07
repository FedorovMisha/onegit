//
//  Colors.swift
//  OneGit
//
//  Created by Misha Fedorov on 07.03.2022.
//

import Foundation
import UIKit

extension UIColor {

    static var applicationPurpleColor: UIColor {
        hexStringToUIColor(hex: "6841DA")
    }
    
    static var lightPinkTextColor: UIColor {
        hexStringToUIColor(hex: "FAEAF4")
    }

    static var lightPinkColor: UIColor {
        hexStringToUIColor(hex: "FAEAF4")
    }
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
