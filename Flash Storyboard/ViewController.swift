//
//  ViewController.swift
//  Flash Storyboard
//
//  Created by Konstantin on 08.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var colorSwitch = 0
    
    override var prefersStatusBarHidden: Bool {	
        return true
    }
    
    fileprivate func switchColor() {
        switch colorSwitch {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .yellow
        case 2:
            view.backgroundColor = .green
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

}

