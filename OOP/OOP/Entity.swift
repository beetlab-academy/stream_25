import Foundation

// определяем сущности

struct User {
    let name: String
    let age: Int
    let dept: Department1 // зависимость
}

// в структуре = сколько угодно конструкторов

struct User1 {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    init() {
        name = ""
        age = 0
    }
}


// код тут писать нельзя!

// User()

class Department {
    let boss: User // зависимость - Department зависит от User
    
    // в классе конструктор обязательный
    init(boss: User) {
        self.boss = boss
    }
}

// зависимость - когда в свойстве класса/структуры находится другой класс/структура

// инъекция зависимости - когда мы в свойство или конструктор класса/структуры помещаем другой класс / структуру

// если свойство optional - оно на момент создания объекта NIL
class Department1 {
    var boss: User1! // injected
    
    var count = 0
    
    func f() {
        count += 1
    }
}



