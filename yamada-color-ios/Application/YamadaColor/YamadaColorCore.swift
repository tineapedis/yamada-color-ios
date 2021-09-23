//
//  YamadaColorCore.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/22
//
//

import ComposableArchitecture
import SwiftUI

struct YamadaColorState: Equatable {
    var yamadaColor: YamadaColor
}

enum YamadaColorAction {
    case didChangeColor(Color)
}

struct YamadaColorEnvironment {}

let yamadaColorReducer = Reducer<YamadaColorState, YamadaColorAction, YamadaColorEnvironment>.combine(
    Reducer { state, action, _ in
        switch action {
        case .didChangeColor(let color):
            state.yamadaColor = YamadaColor(color: color, hex: "TODO: ColorからHEX値を求める")
            return .none
        }
    }
)
