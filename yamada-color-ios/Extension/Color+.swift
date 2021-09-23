//
//  Color+.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/24
//
//

import SwiftUI
import UIKit

extension Color {
    func toUIColor() -> UIColor? {
        guard let cgColor = self.cgColor else {
            return nil
        }
        return UIColor(cgColor: cgColor)
    }
}
