//
//  Storage.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import Foundation

typealias StorageKey = String

protocol Storage {
    func set(value: Any, for: StorageKey)
    func value(for: StorageKey) -> Any?
}

class StorageImpl: Storage {
    static let shared = StorageImpl()
    
    var dict: [StorageKey: Any] = [:]
    
    func set(value: Any, for key: StorageKey) {
        dict[key] = value
    }
    
    func value(for key: StorageKey) -> Any? {
        dict[key]
    }
}
