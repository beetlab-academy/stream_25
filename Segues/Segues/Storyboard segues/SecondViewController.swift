//
//  SecondViewController.swift
//  Segues
//
//  Created by Krasa on 18.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var context = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("context - \(context)")
        print("[SecondViewController] viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("[SecondViewController] viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.text = context

        print("[SecondViewController] viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("[SecondViewController] viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("[SecondViewController] viewDidDisappear")
    }

    
    @IBAction func back() {
        print("[SecondViewController] back")
        dismiss(animated: true, completion: nil)
    }
}
