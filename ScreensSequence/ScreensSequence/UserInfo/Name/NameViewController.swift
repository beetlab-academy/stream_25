//
//  NameViewController.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

protocol NameViewControllerCallback {
    func nameDone(in: UIViewController)
}

class NameViewController: UIViewController, DangerView {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    var storage: Storage! // injected
    var callback: NameViewControllerCallback! // injected
    
    @IBAction func next() {
        if validate(closure: {
        return self.nameTextField.text != ""
            && self.secondNameTextField.text != ""
            && self.lastNameTextField.text != ""
        }) {
            let user = User(name: nameTextField.text!,
                            secondName: secondNameTextField.text!,
                            lastName: lastNameTextField.text!)
            storage.set(value: user, for: userStorageKey)
            
            callback.nameDone(in: self)
        }
    }
}
