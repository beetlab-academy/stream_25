//
//  SecondVCManual.swift
//  Segues
//
//  Created by Krasa on 18.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

class SecondVCManual: UIViewController {
    var labelText = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = labelText
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
}
