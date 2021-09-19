//
//  MainCore.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/19.
//

import ComposableArchitecture

struct MainState {
    enum TabType {
        case create
        case list
    }

    var selectedTab = TabType.create
}

enum MainAction {
    case didTapTab(MainState.TabType)
}

struct MainEnvironment {}

let mainReducer = Reducer<MainState, MainAction, MainEnvironment>.combine(
    //    Reducer { state, action, environment in
    //    }
)
