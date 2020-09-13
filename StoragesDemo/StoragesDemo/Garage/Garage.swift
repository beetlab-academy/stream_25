//
//  Garage.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

// https://habr.com/ru/post/456588/

let floorCacheKey = "KEY"

struct Slot: Codable {}

struct Floor: Codable {/* что было */}

// ASSEMBLY ONLY //
class Garage {
    var storage: DataStorage! // injected -> зависимость

    func park(/*суда тачку*/) {
        var floors = getFloors() // работаете с локальной переменной вместо свойства
        
        // логика парковки, floors изменился
        
        set(floors: floors)
    }
    
    func unpark(/*суда тикет*/) {
        var floors = getFloors() // работаете с локальной переменной вместо свойства
        
        // логика поиска, floors изменился
        
        set(floors: floors)
    }
    
    func getFloors() -> [Floor] {
        guard let data = storage.get(for: floorCacheKey) else {
            print("data not found")
            return []
        }
        
        do {
            let floors = try JSONDecoder().decode([Floor].self, from: data)
            return floors
        } catch {
            print("decoding error \(error)")
            return []
        }
    }
    
    func set(floors: [Floor]) {
        do {
            let data = try JSONEncoder().encode(floors)
            storage.put(data: data, for: floorCacheKey)
        } catch {
            print("error storing floors \(error)")
        }
    }
}
