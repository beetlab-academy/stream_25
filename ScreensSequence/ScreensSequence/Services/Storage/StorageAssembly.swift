//
//  StorageAssembly.swift
//  ScreensSequence
//
//  Created by Krasa on 25.10.2020.
//  Copyright © 2020 Acad. All rights reserved.
//

import Foundation

class StorageAssembly {
    var storage: Storage {
        StorageImpl.shared
    }
}
