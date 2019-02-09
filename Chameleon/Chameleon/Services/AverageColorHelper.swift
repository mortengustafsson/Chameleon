//
//  AverageColorHelper.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 09/02/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit
import AVFoundation

struct AverageColorHelper {

    // Inspiration to this code:
    // https://portfolio.juliensagot.fr
    // https://gist.github.com/juliensagot
    // https://gist.github.com/juliensagot/602f27776fdf0e0d7c92dd52a2f94662

    public static func getAverageColor(of sampleBuffer: CMSampleBuffer) -> UIColor? {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return nil }
        let inputImage: CIImage = CIImage(cvPixelBuffer: pixelBuffer)

        let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)

        guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)
        let context = CIContext(options: [CIContextOption.workingColorSpace: kCFNull])
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: CIFormat.RGBA8, colorSpace: nil)

        return UIColor(red: CGFloat(bitmap[0]) / 255, green: CGFloat(bitmap[1]) / 255, blue: CGFloat(bitmap[2]) / 255, alpha: CGFloat(bitmap[3]) / 255)
    }
}
