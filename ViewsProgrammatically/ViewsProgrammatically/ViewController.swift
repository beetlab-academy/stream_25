//
//  ViewController.swift
//  ViewsProgrammatically
//
//  Created by Krasa on 15.11.2020.
//  Copyright © 2020 Contractors. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var loginForm: LoginFormView = {
        let view = LoginFormView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(view)
        view.callback = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyConstraints()
            // Do any additional setup after loading the view.
    }
}

private extension ViewController {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            loginForm.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginForm.leftAnchor.constraint(equalTo: view.leftAnchor,
                                            constant: 24),
            loginForm.rightAnchor.constraint(equalTo: view.rightAnchor,
                                            constant: -24)
        ])
    }
}

extension ViewController: LoginFormViewCallback {
    func entered(login: String, password: String) {
        print("login: \(login) password \(password)")
    }
}
