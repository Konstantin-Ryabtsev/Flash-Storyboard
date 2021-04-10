//
//  ViewController.swift
//  Flash Storyboard
//
//  Created by Konstantin on 08.04.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var colorSwitch = 0
    
    override var prefersStatusBarHidden: Bool {	
        return true
    }
    
    /// Swith color based on colorSwitch variable: 0-red, 1-yellow, 2-green
    func switchColor() {
        switch colorSwitch {
        case 0:
            view.backgroundColor = .red
            toggleTorch(on: false)
        case 1:
            view.backgroundColor = .yellow
            toggleTorch(on: false)
        case 2:
            view.backgroundColor = .green
            toggleTorch(on: true)
        default:
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        colorSwitch = colorSwitch + 1 > 2 ? 0 : colorSwitch + 1
        switchColor()
    }
    
    /// Check if we can use tourch on device and switch it
    /// - Parameter on: switch torch true-enable, false-disable
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
}

