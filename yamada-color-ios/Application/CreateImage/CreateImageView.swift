//
//  CreateView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/19.
//

import ComposableArchitecture
import SwiftUI

struct CreateImageView: View {
    let store: Store<CreateImageState, CreateImageAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                viewStore.state.yamadaImage
                    .resizable()
                    .scaledToFill()
                    .padding(5)
                yamadaColorViews(store)
                Button(action: {
                    // TODO: Saveボタン処理実装
                }) {
                    Text("Save")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 120,
                               height: 30,
                               alignment: .center)
                }
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

private func yamadaColorViews(_ store: Store<CreateImageState, CreateImageAction>) -> some View {
    WithViewStore(store) { _ in
        VStack(spacing: 10) {
            YamadaColorView(color: YamadaDefaultColorType.purple.color,
                            store: store.scope(state: { $0.purpleYamadaColor },
                                               action: CreateImageAction.purpleYamadaColor))
            YamadaColorView(color: YamadaDefaultColorType.yellow.color,
                            store: store.scope(state: { $0.yellowYamadaColor },
                                               action: CreateImageAction.yellowYamadaColor))
            YamadaColorView(color: YamadaDefaultColorType.black.color,
                            store: store.scope(state: { $0.blackYamadaColor },
                                               action: CreateImageAction.blackYamadaColor))
            YamadaColorView(color: YamadaDefaultColorType.pink.color,
                            store: store.scope(state: { $0.pinkYamadaColor },
                                               action: CreateImageAction.pinkYamadaColor))
        }.padding(10)
    }
}

struct CreateImageView_Previews: PreviewProvider {
    static var previews: some View {
        CreateImageView(store: .init(initialState: .init(),
                                     reducer: createImageReducer,
                                     environment: CreateImageEnvironment()))
    }
}
