//
//  YamadaDefaultColorType.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/20
//
//

import SwiftUI

enum YamadaDefaultColorType {
    case black
    case yellow
    case purple
    case pink

    var color: Color {
        switch self {
        case .black:
            return Color(Colors.yamadaBlack.color)
        case .yellow:
            return Color(Colors.yamadaYellow.color)
        case .purple:
            return Color(Colors.yamadaPurple.color)
        case .pink:
            return Color(Colors.yamadaPink.color)
        }
    }

    var hex: String {
        switch self {
        case .black:
            return "#000000"
        case .yellow:
            return "#FFFF00"
        case .purple:
            return "#BA0072"
        case .pink:
            return "#FFC0CB"
        }
    }
}
