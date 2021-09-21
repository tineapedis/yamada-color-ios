//
//  ColorSelectView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/20.
//

import ComposableArchitecture
import SwiftUI

struct ColorSelectView: View {
    @State var color = Color.red
    let store: Store<ColorSelectState, ColorSelectAction>
    let purpleAreaColor = YamadaColor(defaultType: .purple)
    let blackAreaColor = YamadaColor(defaultType: .black)
    let yellowAreaColor = YamadaColor(defaultType: .yellow)
    let pinkAreaColor = YamadaColor(defaultType: .pink)

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack(spacing: 10) {
                VStack(spacing: 10) {
                    colorButtonView(viewStore: viewStore,
                                    yamadaColor: purpleAreaColor,
                                    color: $color)
                    colorButtonView(viewStore: viewStore,
                                    yamadaColor: blackAreaColor,
                                    color: $color)
                }
                VStack(spacing: 10) {
                    colorButtonView(viewStore: viewStore,
                                    yamadaColor: yellowAreaColor,
                                    color: $color)
                    colorButtonView(viewStore: viewStore,
                                    yamadaColor: pinkAreaColor,
                                    color: $color)
                }
            }.padding(10)
        }
    }
}

private func colorButtonView(viewStore: ViewStore<ColorSelectState, ColorSelectAction>,
                             yamadaColor: YamadaColor,
                             color: Binding<Color>) -> some View {
    let button = Button(action: {
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

    return VStack {
        button
        ColorPicker.init("test", selection: color)
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
