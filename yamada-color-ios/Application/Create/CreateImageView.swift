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
        WithViewStore(self.store) { viewStore in
            VStack {
                Image("yamada")
                    .resizable()
                    .scaledToFill()
                    .padding(10)
                ColorSelectView(store: .init(initialState: viewStore.colorSelectState,
                                             reducer: colorSelectReducer,
                                             environment: ColorSelectEnvironment()))
                Button(action: {
                    // TODO: Createボタン処理実装
                }) {
                    Text("Create")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width: 150,
                               height: 40,
                               alignment: .center)
                }
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct CreateImageView_Previews: PreviewProvider {
    static var previews: some View {
        CreateImageView(store: .init(initialState: .init(),
                                     reducer: createImageReducer,
                                     environment: CreateImageEnvironment()))
    }
}
