//
//  CreateImageCore.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/24
//
//

import ComposableArchitecture

struct CreateImageState: Equatable {
    var colorSelectState = ColorSelectState()
}

enum CreateImageAction {
    case colorSelectAction(ColorSelectAction)
}

struct CreateImageEnvironment {}

let createImageReducer = Reducer<CreateImageState, CreateImageAction, CreateImageEnvironment>.combine(
    Reducer { _, action, _ in
        switch action {
        case .colorSelectAction(let colorSelectAction):
            return .none
        }
    }
)
