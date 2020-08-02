import UIKit

var str = "Hello, playground"

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
    
    let string = String(data: data, encoding: .utf8)
} catch {
    print("encoding error \(error)")
}
