//
//  ColorSelectCore.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/20
//
//

import ComposableArchitecture

struct ColorSelectState: Equatable {
    var purpleYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .purple))
    var yellowYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .yellow))
    var blackYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .black))
    var pinkYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .pink))
}

enum ColorSelectAction {
    case purpleYamadaColor(YamadaColorAction)
    case yellowYamadaColor(YamadaColorAction)
    case blackYamadaColor(YamadaColorAction)
    case pinkYamadaColor(YamadaColorAction)
}

struct ColorSelectEnvironment {}

let colorSelectReducer = Reducer<ColorSelectState, ColorSelectAction, ColorSelectEnvironment>.combine(
    yamadaColorReducer.pullback(
        state: \ColorSelectState.purpleYamadaColor,
        action: /ColorSelectAction.purpleYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    yamadaColorReducer.pullback(
        state: \ColorSelectState.yellowYamadaColor,
        action: /ColorSelectAction.yellowYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    yamadaColorReducer.pullback(
        state: \ColorSelectState.blackYamadaColor,
        action: /ColorSelectAction.blackYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    yamadaColorReducer.pullback(
        state: \ColorSelectState.pinkYamadaColor,
        action: /ColorSelectAction.pinkYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    )
)
