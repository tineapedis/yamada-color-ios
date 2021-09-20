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
    let purpleAreaColor = YamadaColor(defaultType: .purple)
    let blackAreaColor = YamadaColor(defaultType: .black)
    let yellowAreaColor = YamadaColor(defaultType: .yellow)
    let pinkAreaColor = YamadaColor(defaultType: .pink)

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    colorButtonView(viewStore: viewStore, yamadaColor: purpleAreaColor)
                    colorButtonView(viewStore: viewStore, yamadaColor: blackAreaColor)
                }
                VStack(spacing: 10) {
                    colorButtonView(viewStore: viewStore, yamadaColor: yellowAreaColor)
                    colorButtonView(viewStore: viewStore, yamadaColor: pinkAreaColor)
                }
            }.padding(10)
        }
    }
}

func colorButtonView(viewStore: ViewStore<ColorSelectState, ColorSelectAction>,
                     yamadaColor: YamadaColor) -> some View {
    return Button(action: {
        viewStore.send(.didTapColorButton)
    }) {
        Text(yamadaColor.hex)
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
    }
    .background(yamadaColor.color)
    .cornerRadius(20)
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectView(store: .init(
                            initialState: ColorSelectState(),
                            reducer: colorSelectReducer,
                            environment: ColorSelectEnvironment()))
    }
}
