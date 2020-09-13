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

// секрет протоколов - реализация по умолчанию

protocol A {
    func f()
}

extension A {
    func f() {
        print("default implementation")
    }
}


// Data -  байты. Сериализация - это когда любой объект переводим в Data. И наоборот - из Data мы можем получить тот же объект.

// как будет работать сериализация:

// чтобы положить юзера в сторадж - User -> Data, затем Data положить в сторадж

//  сериализация: (User -> Data)

struct Passport: Codable {
    let number: String
    let expireAt: Date
    
    static var demo: Passport {
        return Passport(number: "{pass_num}", expireAt: Date())
    }
}

struct User: Codable {
    let id: String
    let name: String
    let pass: Passport
}



func encode(user: User) -> Data? {
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(user)
        print("success \(String(data: data, encoding: .utf8))")
        return data
    } catch {
        print("error \(error)")
        return nil
    }
}

let user = User(id: UUID().uuidString, name: "Александр",
                pass: .demo)
let data = encode(user: user)

extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}

print("serialized user raw data \(data?.hexEncodedString())")


// КАК РАБОТАЕТ ТРАЙ КЕТЧ СМОТРИ ТУТА:

struct MyError: LocalizedError {
    var localizedDescription: String {
        return "Произошла ошибка!!!!!!"
    }
}

// ПРО ТРАЙ КЕТЧ https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html

struct MyError1: LocalizedError {
    let localizedDescription: String
}

func doJob(digit: Int) throws -> Int {
    print("doing job")
    
    if digit % 2 == 0 {
        throw MyError1(localizedDescription: "четное число - ошибка") // ключевое слово = выкидывает ошибку
    } else {
        return digit
    }
}

do {
    let result = try doJob(digit: 11)
    print("do job result \(result)")
} catch {
    print("do job error \(error)")
}

//  КАК ЭТО ВСЕ ИСПОЛЬЗОВАТЬ

let dataStorage = StoragesAssembly().persistantStorage

let usersArray = [User(id: "sfwr", name: "sdegw", pass: .demo), User(id: "sfwr", name: "sdegw", pass: .demo), User(id: "sfwr", name: "sdegw", pass: .demo)] // вы обещали, что можете себе представить, что это массив этажей

// ВНИМАНИЕ - Floor и Slot - Codable (как юзер)

func store(users: [User]) {
    do {
        let data = try JSONEncoder().encode(users)
        let str = String(data: data, encoding: .utf8)
        print("users store format: \(str)")
        dataStorage.put(data: data, for: "KEY")
    } catch {
        print("store error \(error)")
    }
}

func getUsers() -> [User]? {
    do {
        guard let data = dataStorage.get(for: "KEY") else {
            print("no data found")
            return nil
        }
        
        /* [User].self - указывает, в какой тип нужно декодировать, вам  нужно [Floor].self*/
        let users = try JSONDecoder().decode([User].self, from: data)
        return users
    } catch {
        print("load error \(error)")
        return nil
    }
}

store(users: usersArray)
let users = getUsers()
print(users)

// задача номер раз - заменить у Storage Any на Data аргумент

// задача два - получать этажи из стораджа и записывать их туда (см. Garage.swift)

// - реализовать схему запуска проекта - с лоунчером (не UsersLauncher, а FloorLauncher - переименовать и доставать с диска этажи, а не юзеров)
// -> start program (main.swift) -> assembly (garage) -> UsersLauncher() /*чтобы наполнить сторадж этажами -> парковка/распарковка - работа с гаражом*/

/*этажи пишем в сторадж, когда паркуем и распарковываем*/

class UsersLauncher {
    var storage: DataStorage!
    
    func run() {
        guard getUsers() == nil else { return }
        
        let users = [User(id: "sdjvnerjvn",
                          name: "rverreggr",
                          pass: .demo)] // здесь надо генерить массив этажей, а не юзеров
        
        store(users: users)
    }
    
    func store(users: [User]) {
        do {
            let data = try JSONEncoder().encode(users)
            let str = String(data: data, encoding: .utf8)
            print("users store format: \(str)")
            dataStorage.put(data: data, for: "KEY")
        } catch {
            print("store error \(error)")
        }
    }

    
    func getUsers() -> [User]? {
        do {
            guard let data = dataStorage.get(for: "KEY") else {
                print("no data found")
                return nil
            }
            
            /* [User].self - указывает, в какой тип нужно декодировать, вам  нужно [Floor].self*/
            let users = try JSONDecoder().decode([User].self, from: data)
            return users
        } catch {
            print("load error \(error)")
            return nil
        }
    }
}

class LaunchersAssembly {
    let storagesAssembly = StoragesAssembly()
    
    var userLauncher: UsersLauncher {
        let launcher = UsersLauncher()
        launcher.storage = storagesAssembly.persistantStorage
        
        return launcher
    }
}


let garage = GarageAssembly().garage
let launcher = LaunchersAssembly().userLauncher

launcher.run()

garage.park()
garage.unpark()
