//
//  YamadaColorView.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/22
//
//

import ComposableArchitecture
import SwiftUI

struct YamadaColorView: View {
    @State var color = Color.red
    let store: Store<YamadaColorState, YamadaColorAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Button(action: {
                }) {
                    Text(viewStore.yamadaColor.hex)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(viewStore.yamadaColor.color)
                .cornerRadius(20)
                ColorPicker("test", selection: $color)
                    .onChange(of: color, perform: { _ in
                        viewStore.send(.didChangeColor(color))
                    })
            }
        }
    }
}

struct YamadaColorView_Previews: PreviewProvider {
    static var previews: some View {
        YamadaColorView(store: .init(
                            initialState: YamadaColorState(yamadaColor: .init(defaultType: .purple)),
                            reducer: yamadaColorReducer,
                            environment: YamadaColorEnvironment())
        )
    }
}
