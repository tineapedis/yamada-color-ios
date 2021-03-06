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
    // FIXME: 消す
    @State var color: Color
    @State var store: Store<YamadaColorState, YamadaColorAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Text(viewStore.yamadaColor.hex)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(viewStore.yamadaColor.color)
                    .cornerRadius(10)
                ColorPicker("", selection: $color, supportsOpacity: false)
                    .labelsHidden()
                    .onChange(of: color, perform: { _ in
                        viewStore.send(.didChangeColor(color))
                    })
            }
        }
    }
}

struct YamadaColorView_Previews: PreviewProvider {
    static var previews: some View {
        YamadaColorView(color: YamadaDefaultColorType.purple.color,
                        store: .init(
                            initialState: YamadaColorState(yamadaColor: .init(defaultType: .purple)),
                            reducer: yamadaColorReducer,
                            environment: YamadaColorEnvironment())
        )
    }
}
