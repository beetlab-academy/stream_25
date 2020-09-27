import UIKit

var str = "Hello, playground"

// КЛАССЫ И наследование, reference type vs value type -> SOLID


/*
 entry point (main.swift)
 
 func main() -> f() -> g()
 
 Функция исполняется и, завершив работу, передает управление вызвавшей функции
 */

func f1() {
    print("point 1")
    f2()
    print("point 2")
    print("return")
}

func f2() {
    print("f2 running")
}

print("program starts")
f1()
print("program ends")

/*
 https://ru.wikipedia.org/wiki/Стек_вызовов
 stack (область оперативной память):
 
 main | f1() | f2() -> когда вызвана f2() и в консоли "f2 running"
 main | f1() -> f2() выкинута из стека, продолжает f1()
 main | f1 все "program ends"
 | программа завершена - стек пуст
 
*/

// что лежит в стеке

func g(arg1: Int) -> Int {
    let z = arg1 + 12
    return z
}
 // в стеке лежит аргумент [(arg1), (z), 12]
// |скомпилированные инструкции в бинарном виде (1010101)| секция данных (важен размер переменных, чтобы мы могли спланировать память) [(arg1), (z), 12] |


class IntStack {
    private var array: [Int] = []
    
    func push(_ value: Int) {
        array.append(value)
    }
    
    func pop() -> Int? {
        guard !array.isEmpty else { return nil }
        
        return array.removeLast()
    }
}

class Queue {
    private var array: [Int] = []
    
    func enqueue(_ value: Int) {
        array.append(value)
    }
    
    func dequeue() -> Int? {
        guard !array.isEmpty else { return nil }
        
        return array.removeFirst()
    }
}
// [(arg1), (z), 12]                 arg1.................sizeof........................   z...............12......
//                                   0         1       2        3        4        5        6        7        8....
// память для нас - лента с ячейками |________|________|________|________|________|________|________|________|....
// лента тьюринга - машина тьюринга https://ru.wikipedia.org/wiki/Машина_Тьюринга
// ({})[][[([}] -> [] [}
/*
 x - адрес arg1
 x + sizeof(arg1) - адрес z
 x + sizeof(arg1) + sizeof(z) - адрес 12
 
 
 /// где-то где лежат инструкции
 
 let z = arg1 + 12
 return z

 возьми по адресу x затем возьми по адресу x + sizeof(arg1) + sizeof(z) затем сложи и результат кинь в x + sizeof(arg1)
 */

/*
 
 main() {
    f1()
    f2()
 }
 
 // main -> f1() -> выкинули f1() из стека -> f2() -> выикнули f2() из стека
 
 
 // хранилище подготовленных линеек - относительно x спланировано размещшение стековых переменных каждой функции
 
 */

// то, что валяется в стеке называем value type: sizeof мы можем определить на этапе компиляции

struct X{}
enum X1{}

var t: Int?

switch t {
case .some(let value):
    print(value)
case .none:
    print("t - nil")
}

struct Human: Codable {
    static let shared = Human(name: "", age: 0) // этого нет в стеке - это в секции глобальных переменных
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    init() {
        name = ""
        age = 0
    }
}

func f4(arg: Int) {
    let x: [Human] = [Human(name: "", age: 1)]
    var y = Human(name: "", age: 2)
}

struct A {
    var prop = 0
}

// 1. - если мы хотим изменить свойство велью тайпа мы должны поместить его в var контейнер + свойство должно быть var

var a = A()
a.prop = 12

// VS КЛАСС - reference type

/*
 HEAP - куча. Область памяти, которая заполняется динамически (т.е в момент исполнения программы) -> sizeof неизвестен в момент компиляции!!
    https://ru.wikipedia.org/wiki/Куча_(память)
 0         1        2        3        4       6       7         8
 |________|________|________|________|________|________|________|________|
 */

// адрес данных из кучи лежит в стеке. И адрес имеет фиксированный размер - Int64


class A1 {
    let prop1: Int
    var prop2: Int
    
    init(prop1: Int, prop2: Int) {
        self.prop1 = prop1
        self.prop2 = prop2
    }
}

func h() {
    var a = A() // A вся находится в стеке
    a.prop = 12
    
    // vs
    
    let aObj = A1(prop1: 12, prop2: 13) // в стеке лежит адрес aObj, 64 бита, сам объект A1 находится в куче
    aObj.prop2 = 14
}

// список однонаправленный

// 0 -> 13 -> 45 ->  16 ->  1223 -> 12334

class Node {
    var next: Node?
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
}

let firsr = Node(value: 12)
let next = Node(value: 45)

firsr.next = next

class Base {
    
}

class Child1: Base {
    
}

class Child2: Child1 {
    
}

class Child3: Base {
    
}

// уже базовый класс должен что-то уметь делать

class Storage {
    private var dict: [String: Data] = [:] // private сокрывает свойство и от внешних пользователей (оператор .) и от наследников
    
    func put(data: Data, key: String) {
        dict[key] = data
    }
    
    func get(key: String) -> Data? {
        return dict[key]
    }
}

// наследники могут видоизменять поведение базового класса

class UserDefaultsStorage: Storage {
    let defaults = UserDefaults.standard
    
    override func put(data: Data, key: String) {
        defaults.set(data, forKey: key)
    }
    
    override func get(key: String) -> Data? {
        return defaults.object(forKey: key) as? Data
    }
}

// наследники могут расширять - добавлять своего поведения

class StringsStorage: Storage {
    func string(forKey: String) -> String {
        guard let data = get(key: forKey) else { return "" }
        
        return String(data: data, encoding: .utf8) ?? ""
    }
}

let storage = Storage() // наконец можем заводить объекты интерфейсов!!!!!!!!! ура!! (объекты протокола было нельзя)
let userDefaultsStorage = UserDefaultsStorage()

let stringsStorage = StringsStorage()
 // наследники могут 1. заменить реализацию функций базового класса (UserDefaultsStorage), 2. добавить в интерфейс базового класса свой интерфейс (StringsStorage)

// https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html
// https://forums.swift.org/t/why-cant-structs-inherit-from-other-structs/3647/4
// https://medium.com/flawless-app-stories/static-vs-dynamic-dispatch-in-swift-a-decisive-choice-cece1e872d


// ARC (почитайте в гугле)
