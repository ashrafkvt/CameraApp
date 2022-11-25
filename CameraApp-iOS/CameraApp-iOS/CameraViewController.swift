//
//  CameraViewController.swift
//  CameraApp-iOS
//
//  Created by Ashraf on 24/11/22.
//

import Foundation
import UIKit
import AVFoundation


class CameraViewController: UIViewController{
    
    let captureSession = AVCaptureSession()
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    private func configure(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera], mediaType: AVMediaType.video, position: .unspecified)
        
        for device in deviceDiscoverySession.devices{
            if device.position == .back{
                backFacingCamera = device
            }
            else if device.position == .front{
                frontFacingCamera = device
            }
        }
        
        currentDevice = backFacingCamera
        
        guard let captureDeviceInput = try? AVCaptureDeviceInput(device: currentDevice) else{
            return
        }
                
    }
    
}
