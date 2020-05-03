import UIKit

var str: String = "Hello, playground"

func f(a: Int) {
    
}

func g() -> Int {
   return 3
}

let a: Double = 2
let result = g()
 
// пользовательские типы - структуры (ООП - объектно ориентированное программирование)
// абстракция в ООП

// 1 ЧАСТЬ -  определение - описываем, как называется новый тип, используем ключевое struct
// описываем свойства
struct Human {
    // свойства
    let name: String
    let age: Int
    // методы
    func description() -> String {
        let outputStr = "\(name) - \(age)"
        return outputStr
    }
}

// структура является таким же типом данных, как и Int, Double, Bool...

var x: Int = 0

var array: [Human] = []

func d(arg: Human) {
    
}

// d(arg: x)
var y: Double = 0
y = Double(x)
// приведение к типу недоступно с пользовательскими типами

// 2 ЧАСТЬ - создание объектов (экземпляры структуры)
let ivan = Human(name: "Иван", age: 32)
let andrey = Human(name: "Андрей", age: 23)

let array1 = [ivan, andrey]
let array2 = [Human(name: "Иван", age: 32),
              Human(name: "Андрей", age: 23)]

func process(human: Human) {
    
}

process(human: Human(name: "sadfsr", age: 0))
process(human: andrey)

for i in 0..<120 {
    let human = Human(name: "sadfsr \(i)", age: i)
    array.append(human)
    
    let descStr = human.description()// вызов метода
    
    print("массив - \(array.count) \(descStr)")
}

// в свойства мы можем записывать данные

struct Circle {
    var radius: Double
}

var circle = Circle(radius: 12)
circle.radius = 12

// ИНТЕРФЕЙС СТРУКТУРЫ
// - то, что доступно с помощью оператора `.`
circle.radius
andrey.age
let digit: Double = 0


// КОНСТРУКТОР
// `внутри` == `находится в свойстве`
struct Triangle {
    let a: Double // внутри структур могут находиться другие структуры
    let b: Double // внутри структур могут находиться другие структуры
    let c: Double // внутри структур могут находиться другие структуры
    let innerCircle: Circle // внутри структур могут находиться другие структуры
   // let otherTriangle: Triangle // запрещено иметь структуру того же типа
}

// размер структуры Triangle зависит от размера всех свойств, включая свойство otherTriangle того же типа с неизвестным размером
// size(Triangle) = size(Double)`a` + size(Double)`b` + size(Double)`c` + size(Triangle)`otherTriangle`

// почитайте про структуру данных `Список` на вики

struct Triangle1 {
    let a: Double
    let b: Double
    let c: Double
    
    // конструктор - метод, который вызывается при создании структуры
    
    // конструктор треугольника с единчными сторонами
    
    init() {
        // цель конструктора - присвоить значения в свойства любой ценой
        a = 1
        b = 1
        c = 1
    }
    
    // конструктор треугольника по 3 сторонам
    
    init(aValue: Double, bValue: Double, cValue: Double) {
        a = aValue
        b = bValue
        c = cValue
    }
    
    // конструктор равнобедренных треугольников
    
    init(aValue: Double, bValue: Double, abAngle: Double) {
        a = aValue
        b = aValue
        c = sqrt(a * a + b * b - 2 * b * a * cos(abAngle))
    }
    
    func isExists() -> Bool {
        return a + b > c && c + a > b && c + b > a
    }
    
    func triangleType() -> String {
        if isExists() {
            // серия if - else по конфигурации сторон
            return "равнобедренный"
        } else {
            return "не существует"
        }
    }
}

// а если класс - конструктор обязателен

class Rect {
    let width: Double
    let height: Double
    
    init(widthValue: Double, heightValue: Double) {
        width = widthValue
        height = heightValue
    }
}

// вызовы конструкторов
let triangleInstance1 = Triangle1()
let triangleInstance2 = Triangle1(aValue: 12, bValue: 12, cValue: 12)
let triangleInstance3 = Triangle1(aValue: 12, bValue: 12, abAngle: 45)

let exists = triangleInstance1.isExists()
let type = triangleInstance2.triangleType()

