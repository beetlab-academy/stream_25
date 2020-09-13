//
//  DataStorage.swift
//  StoragesDemo
//
//  Created by nikita on 13/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

typealias DataStorageKey = String

protocol DataStorage {
    func put(data: Data, for: DataStorageKey)
    func get(for: DataStorageKey) -> Data?
}


