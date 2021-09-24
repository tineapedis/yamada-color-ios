//
//  CreateImageCore.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/24
//
//

import ComposableArchitecture
import SwiftUI
import UIKit
import opencv2

struct CreateImageState: Equatable {
    var yamadaImage = Image("yamada")
    var purpleYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .purple))
    var yellowYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .yellow))
    var blackYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .black))
    var pinkYamadaColor = YamadaColorState(yamadaColor: .init(defaultType: .pink))
}

enum CreateImageAction {
    case purpleYamadaColor(YamadaColorAction)
    case yellowYamadaColor(YamadaColorAction)
    case blackYamadaColor(YamadaColorAction)
    case pinkYamadaColor(YamadaColorAction)
}

struct CreateImageEnvironment {}

let createImageReducer = Reducer<CreateImageState, CreateImageAction, CreateImageEnvironment>.combine(
    yamadaColorReducer.pullback(
        state: \CreateImageState.purpleYamadaColor,
        action: /CreateImageAction.purpleYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    yamadaColorReducer.pullback(
        state: \CreateImageState.yellowYamadaColor,
        action: /CreateImageAction.yellowYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    yamadaColorReducer.pullback(
        state: \CreateImageState.blackYamadaColor,
        action: /CreateImageAction.blackYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    yamadaColorReducer.pullback(
        state: \CreateImageState.pinkYamadaColor,
        action: /CreateImageAction.pinkYamadaColor,
        environment: { _ in YamadaColorEnvironment() }
    ),
    Reducer { state, action, _ in
        switch action {
        case .blackYamadaColor(_), .purpleYamadaColor(_), .yellowYamadaColor(_), .pinkYamadaColor(_):
            let srcMat = Mat(uiImage: .init(named: "yamada")!)
            let dstMat = Mat()
            Imgproc.cvtColor(src: srcMat, dst: dstMat, code: .COLOR_RGB2GRAY)
            state.yamadaImage = Image(uiImage: dstMat.toUIImage())
            return .none
        }
    }
)
