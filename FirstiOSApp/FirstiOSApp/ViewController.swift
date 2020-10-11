//
//  ViewController.swift
//  FirstiOSApp
//
//  Created by nikita on 11/10/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import UIKit

class Garage {
    
}

class GarageAssembly {
    var garage: Garage {
        return Garage()
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    let assembly = GarageAssembly()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed() {
        let garage = GarageAssembly().garage
        // данные из текст филдов поместить в объект, который достаете из ассембли
        let inputText = textField.text
        label.text = inputText
    }
    
    // как убрать клавиатуру?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
