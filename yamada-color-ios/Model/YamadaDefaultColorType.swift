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
            return Color(Colors.yamadaBlack.color)
        case .purple:
            return Color(Colors.yamadaBlack.color)
        case .pink:
            return Color(Colors.yamadaBlack.color)
        }
    }
}
