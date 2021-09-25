//
//  CustomeFilter.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/25
//
//

import Foundation
import UIKit

class CustomFilter: CIFilter {
    var inputImage: CIImage?
    private let kernel: CIColorKernel

    override init() {
        let url = Bundle.main.url(forResource: "default", withExtension: "metallib")!
        let data = try! Data(contentsOf: url)
        kernel = try! CIColorKernel(functionName: "customFilter", fromMetalLibraryData: data)
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func outputImage() -> UIImage? {
        let ciContext = CIContext(options: nil)
        guard let inputImage = inputImage,
              let kernelImage = kernel.apply(extent: inputImage.extent, arguments: [inputImage]),
              let outputCGImage = ciContext.createCGImage(kernelImage, from: kernelImage.extent) else {
            return nil
        }

        return UIImage(cgImage: outputCGImage)
    }
}
