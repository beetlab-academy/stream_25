//
//  Garage.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

// https://habr.com/ru/post/456588/

struct Floor {/* что было */}

class Garage {
    var storage: Storage! // injected -> зависимость
    var floors: [Floor]! // injected -> зависимость
    
    /*дома - добавить метод сохранения этажей в сторадж и затем дернуть в main.swift этот метод*/
    
    func store() {
        storage.put(object: floors, forKey: "floors")
    }
    
    /*для пытливых - убрать инъекцию этажей и читать их из стораджа внутри гаража*/
    
    func initialize() {
        floors = storage.get(forKey: "floors") as? [Floor]
    }
}
