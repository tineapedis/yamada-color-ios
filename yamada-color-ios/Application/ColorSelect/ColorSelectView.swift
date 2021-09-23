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
                                store: self.store.scope(state: { $0.purpleYamadaColor },
                                                        action: ColorSelectAction.purpleYamadaColor))
                YamadaColorView(color: YamadaDefaultColorType.yellow.color,
                                store: self.store.scope(state: { $0.yellowYamadaColor },
                                                        action: ColorSelectAction.yellowYamadaColor))
                YamadaColorView(color: YamadaDefaultColorType.black.color,
                                store: self.store.scope(state: { $0.blackYamadaColor },
                                                        action: ColorSelectAction.blackYamadaColor))
                YamadaColorView(color: YamadaDefaultColorType.pink.color,
                                store: self.store.scope(state: { $0.pinkYamadaColor },
                                                        action: ColorSelectAction.pinkYamadaColor))
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
