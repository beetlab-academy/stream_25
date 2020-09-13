//
//  UserDefaultsDataStorage.swift
//  StoragesDemo
//
//  Created by nikita on 13/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

class UserDefaultsDataStorage: DataStorage {
    let defaults = UserDefaults.standard
    
    func put(data: Data, for key: DataStorageKey) {
        defaults.set(data, forKey: key)
    }
    
    func get(for key: DataStorageKey) -> Data? {
        return defaults.data(forKey: key)
    }
}
