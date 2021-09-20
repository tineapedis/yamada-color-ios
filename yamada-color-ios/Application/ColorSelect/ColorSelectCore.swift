//
//  ColorSelectCore.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/20
//
//

import ComposableArchitecture

struct ColorSelectState: Equatable {

}

enum ColorSelectAction {
    case didTapColorButton
}

struct ColorSelectEnvironment {}

let colorSelectReducer = Reducer<ColorSelectState, ColorSelectAction, ColorSelectEnvironment>.combine(
    Reducer { _, action, _ in
        switch action {
        case .didTapColorButton:
            return .none
        }
    }
)
