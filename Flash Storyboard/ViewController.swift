//
//  ViewController.swift
//  Flash Storyboard
//
//  Created by Konstantin on 08.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn = false
    @IBOutlet weak var button: UIButton!
    
    fileprivate func checkLight() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle(" ", for: [])
        checkLight()
    }

    @IBAction func ButtonPress(_ sender: UIButton) {
        isLightOn.toggle()
        checkLight()
    }
    
}

