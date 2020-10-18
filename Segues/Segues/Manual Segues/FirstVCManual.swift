//
//  FirstVCManual.swift
//  Segues
//
//  Created by Krasa on 18.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import UIKit

class FirstVCManual: UIViewController {
    @IBAction func next() {
        guard let nextViewController = storyboard?.instantiateViewController(identifier: "SecondVCManual") as? SecondVCManual else { return }
        
        nextViewController.labelText = "текст для перехода. Суда можно сунуть любой класс / объект"
        
        nextViewController.modalPresentationStyle = .fullScreen
        
        present(nextViewController, animated: true, completion: nil)
        
        // vs
        
        let assembly = SecondVCAssembly()
        present(assembly
            .viewController(labelText: "текст для перехода. Суда можно сунуть любой класс / объект"),
                animated: true,
                completion: nil)
    }
}

class SecondVCAssembly {
    func viewController(labelText: String) -> SecondVCManual {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let nextViewController = storyboard.instantiateViewController(identifier: "SecondVCManual") as? SecondVCManual else { fatalError("couldn't instantiate") }

        nextViewController.modalPresentationStyle = .fullScreen
        nextViewController.labelText = labelText
        
        return nextViewController
    }
}

// Приложение для микрофинансовой организации

/*
 1. Первый экран - ввод фио и паспортных данных + телефон/почта (далее)
 2. Второй экран - ввод инфы о работодателе (инн, название, должность) (далее)
 3. Третий экран - вывести всю инфу - фио, паспортные данные, инфа о работодателе (UITextView и туда отформтировать строку - \(name), \(secondName)\n\n 1. \(passport)\n2. \(reg) и внизу кнопка "оставить заявку". Для пытливых - можете по этой кнопке вывести алерт "{имя}, ваша заявка обрабатывается, мы с вами свяжемся", и затем сбросить второй и третий экраны.
 
 
 UIStackView
 
 */
