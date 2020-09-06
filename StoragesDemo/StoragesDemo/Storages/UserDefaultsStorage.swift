//
//  UserDefaultsStorage.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

class UserDefaultsStorage: Storage {
    let defaults = UserDefaults.standard

    func put(object: Any, forKey: String) {
        defaults.set(object, forKey: forKey)
    }
    
    func get(forKey: String) -> Any? {
        return defaults.object(forKey: forKey)
    }
}
