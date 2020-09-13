//
//  InMemoryStorage.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

class InMemoryStorage: Storage {
    var dictionary: [String: Any] = [:]

    func put(object: Any, forKey: String) {
        dictionary[forKey] = object
    }
    
    func get(forKey: String) -> Any? {
        return dictionary[forKey]
    }
}
