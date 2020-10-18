//
//  ViewController.swift
//  Segues
//
//  Created by Krasa on 18.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let kSegueIdentifier = "FirstSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("[ViewController] viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("[ViewController] viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("[ViewController] viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("[ViewController] viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("[ViewController] viewDidDisappear")
    }

    @IBAction func showNext() {
        performSegue(withIdentifier: kSegueIdentifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SecondViewController else { return }
        
        print("[ViewController] view's window 1 - \(self.view.window)")
        
        destination.context = "seger"
        
        print("[ViewController] destination - \(destination)")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("[ViewController] view's window 2 - \(self.view.window)")
        }
    }
}

