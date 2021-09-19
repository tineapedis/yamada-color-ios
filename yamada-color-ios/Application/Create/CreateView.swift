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
                .frame(maxWidth: .infinity)
                .scaledToFit()
            ColorSelectView()
            Button("Create！", action: {})
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
