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
                    Text("#00000")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.red)
                .cornerRadius(20)

                Button(action: {
                    print("Tap!!")
                }) {
                    Text("#00000")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.blue)
                .cornerRadius(20)

            }
            VStack(spacing: 10) {
                Button(action: {
                    print("Tap!!")
                }) {
                    Text("#00000")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color.green)
                .cornerRadius(20)

                Button(action: {
                    print("Tap!!")
                }) {
                    Text("#00000")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,
                               maxHeight: .infinity)
                }
                .background(Color(Colors.yamadaPink.color))
                .cornerRadius(20)
            }
        }.padding(10)
    }
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectView()
    }
}
