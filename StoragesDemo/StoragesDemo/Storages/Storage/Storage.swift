//
//  Storage.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

protocol Storage {
    func put(object: Any, forKey: String)
    func get(forKey: String) -> Any?
}
