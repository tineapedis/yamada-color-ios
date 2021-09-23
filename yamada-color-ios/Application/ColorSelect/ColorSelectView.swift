//
//  ColorSelectView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/20.
//

import ComposableArchitecture
import SwiftUI

struct ColorSelectView: View {
    let store: Store<ColorSelectState, ColorSelectAction>

    var body: some View {
        WithViewStore(self.store) { _ in
            VStack(spacing: 10) {
                YamadaColorView(color: YamadaDefaultColorType.purple.color,
                                store: .init(initialState: YamadaColorState(yamadaColor: .init(defaultType: .purple)),
                                             reducer: yamadaColorReducer,
                                             environment: YamadaColorEnvironment()))
                YamadaColorView(color: YamadaDefaultColorType.yellow.color,
                                store: .init(initialState: YamadaColorState(yamadaColor: .init(defaultType: .yellow)),
                                             reducer: yamadaColorReducer,
                                             environment: YamadaColorEnvironment()))
                YamadaColorView(color: YamadaDefaultColorType.black.color,
                                store: .init(initialState: YamadaColorState(yamadaColor: .init(defaultType: .black)),
                                             reducer: yamadaColorReducer,
                                             environment: YamadaColorEnvironment()))
                YamadaColorView(color: YamadaDefaultColorType.pink.color,
                                store: .init(initialState: YamadaColorState(yamadaColor: .init(defaultType: .pink)),
                                             reducer: yamadaColorReducer,
                                             environment: YamadaColorEnvironment()))
            }.padding(10)
        }
    }
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectView(store: .init(
                            initialState: ColorSelectState(),
                            reducer: colorSelectReducer,
                            environment: ColorSelectEnvironment()))
    }
}
