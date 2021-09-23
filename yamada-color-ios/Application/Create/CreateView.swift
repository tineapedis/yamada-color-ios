//
//  CreateView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/19.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        VStack {
            Image("yamada")
                .resizable()
                .scaledToFill()
                .padding(10)
            ColorSelectView(store: .init(initialState: ColorSelectState(),
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

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
