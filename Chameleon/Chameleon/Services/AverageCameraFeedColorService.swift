//
//  AverageCameraFeedColorService.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 18/10/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit
import AVFoundation

protocol AverageColorServiceProtocol {
    func getColor() -> UIColor?
}

class AverageCameraFeedColorService: AverageColorServiceProtocol {
    private var cameraFeedService: CameraFeedServiceProtocol
    private var latestMediaSample: CMSampleBuffer?

    init(from cameraFeedService: CameraFeedServiceProtocol) {
        self.cameraFeedService = cameraFeedService
        cameraFeedService.delegate = self
        cameraFeedService.startCapture()
    }

    public func getColor() -> UIColor? {
        guard let mediaSample = latestMediaSample else { return nil }
        guard let averageCapturedColor = AverageColorHelper.getAverageColor(of: mediaSample) else { return nil }
        return averageCapturedColor
    }
}

extension AverageCameraFeedColorService: CameraFeedServiceDelegate {
    func didCaptureMediaSample(sampleBuffer: CMSampleBuffer) {
        latestMediaSample = sampleBuffer
    }
}
