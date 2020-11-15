//
//  LoginFormView.swift
//  ViewsProgrammatically
//
//  Created by Krasa on 15.11.2020.
//  Copyright © 2020 Contractors. All rights reserved.
//

// https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/ViewswithIntrinsicContentSize.html

import UIKit

//enum SettingType {
//    case settingOne(Int, String)
//    case settingTwo
//}
//
//struct SettingType1: Hashable {
//    let value1: Int
//    let value2: String
//        
//    static let one = 15 //SettingType1(value1: 1, value2: "")
//    static let two = SettingType1(value1: 34, value2: "")
//}
//
//func apply(setting: SettingType) {
//    switch setting {
//    case .settingOne(let integer, let myString):
//        break
//    case .settingTwo:
//        break
//    }
//    
//    SettingType1.one
//}
//
//func apply(setting: SettingType1) {
//    switch setting {
//    case .one:
//        setting.value1
//        break
//    case .two:
//        break
//    default:
//        break
//    }
//}


protocol LoginFormViewCallback: class {
    func entered(login: String, password: String)
}

class LoginFormView: UIView {
    weak var callback: LoginFormViewCallback? // injected
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Логин"
        textField.textAlignment = .center
        textField.textContentType = .emailAddress
        textField.font = .systemFont(ofSize: 14)
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.textAlignment = .center
        textField.font = .systemFont(ofSize: 14)
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textField)

        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.addTarget(self,
                         action: #selector(login),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)

        return button
    }()
    
    private lazy var yellowSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        return view
    }()
    
    // obective c runtime
    @objc func login() {
        guard let login = loginTextField.text,
            !login.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty
        else {
            yellowSquare.backgroundColor = .red
            return
        }
        
        yellowSquare.backgroundColor = .yellow
        callback?.entered(login: login, password: password)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.cgColor
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LoginFormView {
    func applyConstraints() {
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: topAnchor,
                                                constant: 16),
            loginTextField.leftAnchor.constraint(equalTo: leftAnchor,
                                                 constant: 16),
            loginTextField.rightAnchor.constraint(equalTo: rightAnchor,
                                                 constant: -16),
            
            passwordTextField.leftAnchor.constraint(equalTo: loginTextField.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: loginTextField.rightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,
                                                   constant: 8),
            
            
            yellowSquare.widthAnchor.constraint(equalToConstant: 40),
            yellowSquare.heightAnchor.constraint(equalToConstant: 40),
            yellowSquare.topAnchor.constraint(equalTo: topAnchor),
            yellowSquare.rightAnchor.constraint(equalTo: rightAnchor),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,
                                             constant: 24),
            loginButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                constant: -16)
        ])
    }
}


