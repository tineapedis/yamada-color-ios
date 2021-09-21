//
//  YamadaColorCore.swift
//  yamada-color-ios
//  
//  Created by nmurata on 2021/09/22
//  
//

import ComposableArchitecture

struct YamadaColorState: Equatable {
    var yamadaColor: YamadaColor
}

enum YamadaColorAction {
    case didChangeColor(YamadaColor)
}

struct YamadaColorEnvironment {}

let yamadaColor = Reducer<YamadaColorState, YamadaColorAction, YamadaColorEnvironment>.combine(
    Reducer { state, action, _ in
        switch action {
        case .didChangeColor(let color):
            state.yamadaColor = color
            return .none
        }
    }
)
