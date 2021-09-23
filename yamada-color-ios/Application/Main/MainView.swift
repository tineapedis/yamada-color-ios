//
//  MainView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/04.
//

import ComposableArchitecture
import SwiftUI

struct MainView: View {
    let store: Store<MainState, MainAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: { $0.selectedTab },
                    send: MainAction.didTapTab
                ),
                content: {
                    CreateImageView(store: .init(initialState: .init(),
                                                 reducer: createImageReducer,
                                                 environment: CreateImageEnvironment()))
                        .tabItem {
                            Image(systemName: "plus.app.fill")
                        }
                        .tag(1)
                    Text("Tab Content 2")
                        .tabItem {
                            Image(systemName: "list.dash")
                        }
                        .tag(2)
                }
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(store: .init(
                    initialState: .init(),
                    reducer: mainReducer,
                    environment: MainEnvironment())
        )
    }
}
