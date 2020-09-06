//
//  main.swift
//  ProtocolsAndArchitecture
//
//  Created by nikita on 06/09/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

print("Hello, World!")

/* Зависимость, протокол, реализация протокола, ассембли */

// ПРОТОКОЛЫ

// key chain, files, in-memory - 3 вида стораджей
/* https://developer.apple.com/documentation/security/certificate_key_and_trust_services/keys/storing_keys_in_the_keychain
*/

// ИНТЕРФЕЙС - то, что можно вызывать с помощью оператора '.' у объекта

struct X {
    let a: Int
    let b: String
    
    func f() {
        
    }
}

let xObj = X(a: 0, b: "")

// все имена типов var m: Type (переменные или свойства), func a(arg: Type) -> Type, var array = [Type]() Type - тип и интерфейс:
//

func f(arg: X) {
    let obj = arg.a
}

// протокол определяет интерфейс - описывает свойства и методы, входящие в интерфейс. Имя типа по сути имя интерфейса. => Любой интерфейс имеет имя

// Any - любой объект

func g(arg: Any) {
    
}

g(arg: 12)
g(arg: "sdvdv")
g(arg: xObj)
g(arg: [1,2,4,4])

protocol Storage {
    func put(object: Any, forKey: String)
    func get(forKey: String) -> Any?
}

// доказательство 1: протокол - такой же тип как и все остальное:

// цитата из гаража

struct ParkingSlot {
    let id: String
    let isOccupied: Bool
    let isTruckSlot: Bool
}

struct Floor {
    let id: String
    let slots: [ParkingSlot]
}

/* в одном из методов гаража  */

func store(floors: [Floor], to: Storage) {
//    floors.
    to.put(object: floors, forKey: "FloorsKey")
}

/* где гарантия того, что у метода put из Storage есть реализация?!!!!*/

// нельзя просто так завести объект протокола!!!!!
//  store(floors: [], to: Storage()) -> не компилится

// ВЫ ПОСТОЯННО ПЫТАЕТЕСЬ ЗАВОДИТЬ ОБЪЕКТЫ ПРОТОКОЛОВ!!! (и потом не научившись пользоваться реализацией протоколов вы падаете духом и отчисляетесь)

// шаг 1 - пишем реализацию протокола


// key chain, files, in-memory - 3 вида стораджей
/* https://developer.apple.com/documentation/security/certificate_key_and_trust_services/keys/storing_keys_in_the_keychain
*/

/*KEY-VALUE STORAGES https://en.wikipedia.org/wiki/Key–value_database */
// Some maintain data in memory (RAM), while others employ solid-state drives or rotating disks

class InMemoryStorage: Storage /*через двоеточие - имя протокола, который хотите реализовать*/ {
    var dictionary = [String: Any]()
    
    func put(object: Any, forKey: String) {
        dictionary[forKey] = object // аналог append у массива
    }
    
    func get(forKey: String) -> Any? {
        return dictionary[forKey] // как в массиве array[1] -> вместо порядкового номера элемента пришем ключ
    }
}

class UserDefaultsStorage: Storage {
    /*
     Способы записи на диск
     
     1 способ = UserDefaults https://developer.apple.com/documentation/foundation/userdefaults
     2 способ = FileManager
        https://developer.apple.com/documentation/foundation/filemanager
     3 способ = Sqllite3 (для сумасшедших, а также для тех, кому нужны фичи sql)
        https://www.raywenderlich.com/6620276-sqlite-with-swift-tutorial-getting-started
     4 способ = CoreData framework, realm framework - как 3 способ, но объектно - ориентированный
     */
    let defaults = UserDefaults.standard // синглтон
    
    func put(object: Any, forKey: String) {
        defaults.set(object, forKey: forKey)
    }
    
    func get(forKey: String) -> Any? {
        return defaults.value(forKey: forKey)
    }
}

/* static  */

struct Y {
    static let гавно = Y(a: 10) // синглтон
    static let standard = 0
    var a: Int
    var array = [Int]()
}

/*чтобы обратиться к свойству 'a'**/
let yObj = Y(a: 10)
yObj.a

Y.standard

let yObj1 = Y.гавно // синглтон
let yObj2 = Y.гавно // синглтон
let yObj3 = Y.гавно // синглтон
let yObj4 = Y.гавно // синглтон
let yObj5 = Y.гавно // синглтон
let yObj6 = Y.гавно // синглтон
let yObj7 = Y.гавно // синглтон
let yObj8 = Y.гавно // синглтон
// https://refactoring.guru/ru/design-patterns/singleton


//struct X1: Storage {
//    func put(object: Any, forKey: String) {
//
//    }
//
//    func get(forKey: String) -> Any? {
//
//    }
//}

// вот я пришел на службу. Тимлид на созвоне сказал: "Используй в своей задаче сторадж на диске" ЧТо было дальше? (ваши действия)
// ну бля ищи там где-то валяется я не знаю все у меня собес пока
// я нашел этот код и пишу

let diskStorage = UserDefaultsStorage()

store(floors: [], to: diskStorage) // о чудо = мы передали реализацию протокола в функцию
// ВАЖНО!!!! МЫ ДОЛЖНЫ ПЕРЕДАТЬ РЕАЛИЗАЦИЮ ПРОТОКОЛА (см. строки 110, 98)

// КАК МЫ БУДЕМ ЭТО ДЕЛАТЬ (ЗАВОДИТЬ ОБЪЕКТЫ, РЕАЛИЗУЮЩИЕ ПРОТОКОЛЫ

// ассембли - классы, поставляющие реализацию

class StoragesAssembly {
    // тут тип - протокол
    var inMemoryStorage: Storage {
        // а тут - реализация
        return InMemoryStorage()
    }
    
    var userDefaultsStorage: Storage {
        return UserDefaultsStorage()
    }
}

// вот я пришел на службу. Тимлид на созвоне сказал: "Используй в своей задаче сторадж на диске" ЧТо было дальше? (ваши действия)
// - что было дальше - а ну ка где в проекте лежат ассембли[?
// - ну ебана вот там-то и там-то
// - збс
// - ну если вопросы будут - пиши

// https://github.com/TinkoffCreditSystems/EasyDi - будем юзать такое и он состоит из ассембли

let assembly = StoragesAssembly()
let storage = assembly.userDefaultsStorage

store(floors: [], to: storage)

// vs

let diskStorage1 = UserDefaultsStorage()
store(floors: [], to: diskStorage1)

protocol A {
    
}

protocol B {
    
}

protocol C {
    
}

class Impl: A, B, C {
    
}

let implObj = Impl()

var i1: A = implObj
var i2: B = implObj
var i3: C = implObj
// полиморфизм = у объекта много интерфейсов
