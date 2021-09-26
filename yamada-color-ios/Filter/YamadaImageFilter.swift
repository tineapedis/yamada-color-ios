//
//  YamadaImageFilter.swift
//  yamada-color-ios
//
//  Created by nmurata on 2021/09/25
//
//

import Foundation
import UIKit

final class YamadaImageFilter: CIFilter {
    private let kernel: CIColorKernel
    private let yamadaImage = UIImage(named: "yamada")!

    override init() {
        let url = Bundle.main.url(forResource: "default", withExtension: "metallib")!
        let data = try! Data(contentsOf: url)
        kernel = try! CIColorKernel(functionName: "yamadaColorChangeFilter", fromMetalLibraryData: data)
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func outputImage(purpleColor: CIColor, yellowColor: CIColor, pinkColor: CIColor, blackColor: CIColor) -> UIImage {
        let ciContext = CIContext(options: nil)
        guard let inputImage = CIImage(image: yamadaImage),
              let kernelImage = kernel.apply(extent: inputImage.extent, arguments: [inputImage, purpleColor, yellowColor, pinkColor, blackColor]),
              let outputCGImage = ciContext.createCGImage(kernelImage, from: kernelImage.extent) else {
            return yamadaImage
        }

        return UIImage(cgImage: outputCGImage)
    }
}
