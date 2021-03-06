//
//  YamadaColor.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/20
//
//

import SwiftUI

struct YamadaColor: Equatable {
    var color: Color
    var hex: String

    init(defaultType: YamadaDefaultColorType) {
        color = defaultType.color
        hex = defaultType.hex
    }

    init(color: Color, hex: String) {
        self.color = color
        self.hex = hex
    }

    var ciColor: CIColor {
        CIColor(cgColor: color.cgColor!)
    }
}
