//
//  ColorSelectView.swift
//  yamada-color-ios
//
//  Created by Naoyuki Murata on 2021/09/20.
//

import SwiftUI

struct ColorSelectView: View {
    let purpleAreaColor = YamadaColor(defaultType: .purple)
    let blackAreaColor = YamadaColor(defaultType: .black)
    let yellowAreaColor = YamadaColor(defaultType: .yellow)
    let pinkAreaColor = YamadaColor(defaultType: .pink)

    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 10) {
                ColorButtonView(yamadaColor: purpleAreaColor)
                ColorButtonView(yamadaColor: blackAreaColor)
            }
            VStack(spacing: 10) {
                ColorButtonView(yamadaColor: yellowAreaColor)
                ColorButtonView(yamadaColor: pinkAreaColor)
            }
        }.padding(10)
    }
}

struct ColorButtonView: View {
    let yamadaColor: YamadaColor

    var body: some View {
        Button(action: {
            print("Tap!!")
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
}

struct ColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectView()
    }
}
