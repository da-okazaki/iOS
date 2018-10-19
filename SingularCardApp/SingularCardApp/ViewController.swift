//
//  ViewController.swift
//  SingularCardApp
//
//  Created by 岡崎大地 on 2018/10/15.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIView {
    override class var layerClass: AnyClass {
        get {
            return AVCaptureVideoPreviewLayer.self
        }
    }
    override var layer: AVCaptureVideoPreviewLayer {
        get {
            return super.layer as! AVCaptureVideoPreviewLayer
        }
    }
}
class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // Camera view
    var cameraView: CameraView!
    // AV capture session and dispatch queue
    let session = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: AVCaptureSession.self.description(), attributes: [], target: nil)
    override func loadView() {
        cameraView = CameraView()
        view = cameraView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        session.beginConfiguration()
        let videoDevice = AVCaptureDevice.default(for: AVMediaType(rawValue: convertFromAVMediaType(AVMediaType.video)))
        if (videoDevice != nil) {
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice)
            if (videoDeviceInput != nil) {
                if (session.canAddInput(videoDeviceInput ?? <#default value#>)) {
                    session.addInput(videoDeviceInput)
                }
            }
            let metadataOutput = AVCaptureMetadataOutput()
            if (session.canAddOutput(metadataOutput)) {
                session.addOutput(metadataOutput)
                metadataOutput.metadataObjectTypes = [
                    convertFromAVMetadataObjectObjectType(AVMetadataObject.ObjectType.ean13),
                    convertFromAVMetadataObjectObjectType(AVMetadataObject.ObjectType.qr)
                ]
                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            }
        }
        session.commitConfiguration()
        cameraView.layer.session = session
        cameraView.layer.videoGravity = AVLayerVideoGravity(rawValue: convertFromAVLayerVideoGravity(AVLayerVideoGravity.resizeAspectFill))
        // Set initial camera orientation
        let videoOrientation: AVCaptureVideoOrientation
        switch UIApplication.shared.statusBarOrientation {
        case .portrait:
            videoOrientation = .portrait
        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown
        case .landscapeLeft:
            videoOrientation = .landscapeLeft
        case .landscapeRight:
            videoOrientation = .landscapeRight
        default:
            videoOrientation = .portrait
        }
        cameraView!;View.layer.connection.videoOrientation = videoOrientation
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Start AV capture session
        sessionQueue.async {
            self.session.startRunning()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Stop AV capture session
        sessionQueue.async {
            self.session.stopRunning()
        }
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        // Update camera orientation
        let videoOrientation: AVCaptureVideoOrientation
        switch UIDevice.current.orientation {
        case .portrait:
            videoOrientation = .portrait
        case .portraitUpsideDown:
            videoOrientation = .portraitUpsideDown
        case .landscapeLeft:
            videoOrientation = .landscapeRight
        case .landscapeRight:
            videoOrientation = .landscapeLeft
        default:
            videoOrientation = .portrait
        }
        cameraView!;View.layer.connection.videoOrientation = videoOrientation
    }
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Display barcode value
        if (metadataObjects.count > 0 && metadataObjects.first is AVMetadataMachineReadableCodeObject) {
            let scan = metadataObjects.first as! AVMetadataMachineReadableCodeObject
            let alertController = UIAlertController(title: "Barcode Scanned", message: scan.stringValue, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVMediaType(_ input: AVMediaType) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVMetadataObjectObjectType(_ input: AVMetadataObject.ObjectType) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVLayerVideoGravity(_ input: AVLayerVideoGravity) -> String {
	return input.rawValue
}
