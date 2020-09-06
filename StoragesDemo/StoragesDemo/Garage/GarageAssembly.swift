//
//  GarageAssembly.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

class GarageAssembly {
    let storagesAssembly = StoragesAssembly()
    
    func garage(with floors: [Floor]) -> Garage {
        let garage = Garage()
        garage.floors = floors // инъекция зависимость в свойство
        garage.storage = storagesAssembly.userDefaults // инъекция зависимости в свойство
        return garage
    }
}
