//
//  StoragesAssembly.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

class StoragesAssembly {
    var inMemory: Storage {
        return InMemoryStorage()
    }
    
    var userDefaults: Storage {
        return UserDefaultsStorage()
    }
}
