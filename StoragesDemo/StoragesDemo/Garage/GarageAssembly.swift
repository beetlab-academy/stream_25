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
    
    var garage: Garage {
        let garage = Garage()
        garage.storage = storagesAssembly.persistantStorage // инъекция зависимости в свойство
        return garage
    }
}
