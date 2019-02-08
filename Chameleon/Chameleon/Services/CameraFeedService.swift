//
//  CameraFeedService.swift
//  Chameleon
//
//  Created by Morten Gustafsson on 08/02/2019.
//  Copyright © 2019 com.mortengustafsson. All rights reserved.
//

import UIKit
import AVFoundation

protocol CameraFeedServiceProtocol: class {
    func startCapture()
    func stopCapture()
    var delegate: CameraFeedServiceDelegate? { get set }
}

protocol CameraFeedServiceDelegate: class {
    func didCaptureMediaSample(sampleBuffer: CMSampleBuffer)
}

class CameraFeedService: NSObject, CameraFeedServiceProtocol {
    weak var delegate: CameraFeedServiceDelegate?

    private var captureSession = AVCaptureSession()
    private var backCamera: AVCaptureDevice?
    private let sampleBufferQueue = DispatchQueue.global(qos: .background)
    private var output = AVCaptureVideoDataOutput()

    override init() {
        super.init()
        setupCaptureSession()
        setuDevice()
        setupInputOutput()
    }

    func startCapture() {
        if !captureSession.isRunning {
            captureSession.startRunning()
        }
    }

    func stopCapture() {
        if captureSession.isRunning {
            captureSession.stopRunning()
        }
    }

    private func setupCaptureSession() {
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
    }

    private func setuDevice() {
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.unspecified)

        let devices = deviceDiscoverySession.devices
        backCamera = devices.first(where: { $0.position == AVCaptureDevice.Position.back })
    }

    private func setupInputOutput() {
        do {
            guard let camera = backCamera else { return }
            let captureDeviceInput = try AVCaptureDeviceInput(device: camera)
            captureSession.addInput(captureDeviceInput)

            output = AVCaptureVideoDataOutput()
            output.alwaysDiscardsLateVideoFrames = true
            output.setSampleBufferDelegate(self, queue: sampleBufferQueue)

            captureSession.addOutput(output)

        } catch {
            print(error)
        }
    }
}

extension CameraFeedService: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        delegate?.didCaptureMediaSample(sampleBuffer: sampleBuffer)
    }
}
