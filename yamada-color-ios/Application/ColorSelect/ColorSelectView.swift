//
//  ColorSelectView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/20.
//

import SwiftUI

struct ColorSelectView: View {
    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 10) {
                Button(action: {
                    print("Tap!!")
                }) {
                    Text("Button")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.red)

                Button(action: {
                    print("Tap!!")
                }) {
                    Text("Button")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.blue)

            }
            VStack(spacing: 10) {
                Button(action: {
                    print("Tap!!")
                }) {
                    Text("Button")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.green)

                Button(action: {
                    print("Tap!!")
                }) {
                    Text("Button")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.orange)
            }
        }.padding(10)
    }
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectView()
    }
}
