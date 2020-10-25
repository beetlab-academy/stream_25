//
//  SummaryViewController.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

protocol SummaryViewControllerCallback {
    func summaryDone()
}

class SummaryViewController: UIViewController, DangerView {
    @IBOutlet weak var summaryTextField: UITextView!
    var storage: Storage! // injected
    var callback: SummaryViewControllerCallback! // injected
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = storage.value(for: userStorageKey) as? User,
            let employer = storage.value(for: employerStorageKey) as? Employer
            else { return }
        
        let str = SummaryFormatter().prettyPrinted(user: user, employer: employer)
        summaryTextField.text = str
    }
    
    @IBAction func done() {
        callback.summaryDone()
    }
}
