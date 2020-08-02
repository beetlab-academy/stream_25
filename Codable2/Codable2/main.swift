//
//  main.swift
//  Codable2
//
//  Created by nikita on 02/08/2020.
//  Copyright © 2020 Academy. All rights reserved.
//

import Foundation

// цель: SomeType -> Data || Data -> SomeType /*Data - абстракция над массивом байтов (Int8) char void**/
// Data -> {"key": value}, value - [], int, string

// базовый вариант

struct User: Codable {
    let name: String
    let age: Int
}

do {
    let user = User(name: "владимир", age: 64)
    let data = try JSONEncoder().encode(user)
    
    let userDecoded = try JSONDecoder().decode(User.self, from: data)
    
    let string = String(data: data, encoding: .utf8)
    print(string)
    print(userDecoded)
} catch {
    print("encoding error \(error)")
}

// расширенный вариант

enum StringEnum: String {
    case first = "wdergreg"
    case second = "wefwrgrg"
}

func f(enumValue: StringEnum) {
    let value = StringEnum(rawValue: "wdergreg")
    enumValue.rawValue
}

struct BankAccount: Encodable {
    let name: String
    let type: String
}

struct BankAccount1 {
    let name: String
    let type: String
    
    /*как называются ключи в сериализованном виде*/
    enum CodingKeys: String, CodingKey {
        case name = "account_name"
        case type = "account_type"
    }
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        type = try container.decode(String.self, forKey: .type)
    }
}

extension BankAccount1: Decodable {}

extension BankAccount1: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
    }
}

do {
    let b = BankAccount(name: "ba", type: "ba")
    let b1 = BankAccount1(name: "ba1", type: "ba1")

    let data = try JSONEncoder().encode(b)
    let data1 = try JSONEncoder().encode(b1)

    let str = String(data: data, encoding: .utf8)
    let str1 = String(data: data1, encoding: .utf8)

    print(str)
    print(str1)
} catch {
    print(error)
}
