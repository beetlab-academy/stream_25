//
//  StackViewByCode.swift
//  IntrisicContentSize+StackView
//
//  Created by Krasa on 06.12.2020.
//  Copyright © 2020 Contractors. All rights reserved.
//

import UIKit

class StackViewByCodeViewController: UIViewController {
    
    private lazy var loginTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "email"
        view.textAlignment = .center
        view.keyboardType = .emailAddress
        view.textContentType = .emailAddress
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        view.textAlignment = .center
        view.keyboardType = .emailAddress
        view.textContentType = .emailAddress
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private lazy var loginButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Login", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Sign in", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [loginTextField,
                                                  passwordTextField,
                                                  loginButton,
                                                  signInButton])
        
        view.setCustomSpacing(8, after: loginTextField)
        view.setCustomSpacing(24, after: passwordTextField)
        view.setCustomSpacing(8, after: loginButton)
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(view)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLayoutConstraint.activate([
            view.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            view.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
    
}
