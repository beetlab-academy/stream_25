//
//  main.swift
//  StoragesDemo
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

print("Hello, World!")

let storage = StoragesAssembly().inMemory

let obj: Int = 12

storage.put(object: obj, forKey: "object_key")

let storedObject = storage.get(forKey: "object_key") as? Int // безопасное приведение к типу - в результате Int?

let storedObject1 = storage.get(forKey: "object_key") as! Int // небезопасное приведение к типу - в результате Int?


if let storedObject2 = storage.get(forKey: "object_key") as? Int {
    // `int без вопроса
    // код пишем с табом
} else {
    // тут нил
}

guard let storedObject3 = storage.get(forKey: "object_key") as? Int else {
    // тут нил
    //return
    exit(-1)
}

// код пишем без таба
storedObject3

var floors = [Floor]()

for _ in 0...10000 {
    floors.append(Floor())
}

let assembly = GarageAssembly()
let garage = assembly.garage(with: floors)

// garage.park()

// vs

let garage1 = Garage()
let storage1 = InMemoryStorage()

garage1.floors = floors
garage1.storage = storage1

// garaga1.park()
