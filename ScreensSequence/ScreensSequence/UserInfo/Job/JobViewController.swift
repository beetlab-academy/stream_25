//
//  JobViewController.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

protocol JobViewControllerCallback {
    func jobDone(in: UIViewController)
}

class JobViewController: UIViewController, DangerView {
    @IBOutlet weak var jobNameTextField: UITextField!
    @IBOutlet weak var innTextField: UITextField!
    @IBOutlet weak var jobTitleTextField: UITextField!
    
    var storage: Storage! // injected
    var callback: JobViewControllerCallback! // injected
    
    @IBAction func next() {
        if validate(closure: {
        return self.jobNameTextField.text != ""
            && self.innTextField.text != ""
            && self.jobTitleTextField.text != ""
        }) {
            let employer = Employer(name: jobNameTextField.text!,
                            inn: innTextField.text!,
                            job: jobTitleTextField.text!)
            storage.set(value: employer, for: employerStorageKey)
            callback.jobDone(in: self)
        }
    }
}

