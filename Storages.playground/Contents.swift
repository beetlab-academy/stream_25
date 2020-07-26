import UIKit

var str = "Hello, playground"

struct AccountData {
    let current: Any?
    let savings: Any?
    let client: Any?
    let settings: Any?
    // все что в словарях валяется //
}


protocol Storage {
    func set(entity: AccountData, key: String)
    func getEntity(key: String) -> AccountData?
}

class InMemoryStorage: Storage {
    static let shared = InMemoryStorage()
    var dict: [String: AccountData] = [:]

    func set(entity: AccountData, key: String) {
        dict[key] = entity
    }
    
    func getEntity(key: String) -> AccountData? {
        dict[key]
    }
}

/*прочитать про протокол Codable структура AccountData сериализуется (то есть превращается в Data)*/

class DiskStorage: Storage {
    static let shared = DiskStorage()
    let storage = UserDefaults.standard

    func set(entity: AccountData, key: String) {
        let entityData = Data() // но тут ты должен из AccountData получить Data с помощью Codable
        storage.set(entityData, forKey: key)
    }
    
    func getEntity(key: String) -> AccountData? {
        guard let entityData = storage.value(forKey: key) else { return nil }
        
        return nil /*entityData превратить обратно в AccountData c помощью Codable*/
    }
}

class StoragesAssembly {
    var inMemoryStorage: Storage {
        InMemoryStorage.shared
    }
    
    var diskStorage: Storage {
        DiskStorage.shared
    }
}

/*в качестве эксперимента - домотканая ассембли
 https://habr.com/ru/post/331710/
 Cocoapods - менеджер пакетов
 */

enum ObjectScope {
    case regular
    case singleton
}

class Assembly {
    var singletons: [String: Any] = [:]
    var factories: [String: (()-> Void)] = [:]
    
    func define(scope: ObjectScope, factory: () -> T) {
    }
}

