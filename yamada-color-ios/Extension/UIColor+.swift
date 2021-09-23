//
//  UIColor+.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/24
//
//

import UIKit

extension UIColor {
    func toHex() -> NSString {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let rgb = (Int)(red*255)<<16 | (Int)(green*255)<<8 | (Int)(blue*255)<<0

        return NSString(format: "#%06x", rgb)
    }
}
