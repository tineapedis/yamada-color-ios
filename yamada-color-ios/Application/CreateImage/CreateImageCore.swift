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

struct CreateImageState: Equatable {
    var yamadaImage = UIImage(named: "yamada")
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
    case didTapSaveButton
}

struct CreateImageEnvironment {
    var yamadaImageFilter = YamadaImageFilter()
}

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
    Reducer { state, action, environment in
        switch action {
        case .blackYamadaColor(_), .purpleYamadaColor(_), .yellowYamadaColor(_), .pinkYamadaColor(_):
            let uiImage = environment.yamadaImageFilter.outputImage(purpleColor: state.purpleYamadaColor.yamadaColor.ciColor,
                                                                    yellowColor: state.yellowYamadaColor.yamadaColor.ciColor,
                                                                    pinkColor: state.pinkYamadaColor.yamadaColor.ciColor,
                                                                    blackColor: state.blackYamadaColor.yamadaColor.ciColor)
            state.yamadaImage = uiImage
            return .none
        case .didTapSaveButton:
            UIImageWriteToSavedPhotosAlbum(state.yamadaImage!, nil, nil, nil)
            return .none
        }
    }
)
