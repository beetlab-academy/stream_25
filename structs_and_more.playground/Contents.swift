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
    
    func perimeter() -> Double {
        return 2 * (self.width + self.height)
    }
}

// вызовы конструкторов
let triangleInstance1 = Triangle1()
let triangleInstance2 = Triangle1(aValue: 12, bValue: 12, cValue: 12)
let triangleInstance3 = Triangle1(aValue: 12, bValue: 12, abAngle: 45)

let exists = triangleInstance1.isExists()
let type = triangleInstance2.triangleType()

/*
 Упражнения
 
 1. Сделать структуру `прямоугольник` со свойствами длина и ширина. Написать методы вычисления периметра по площади
 2. К 1 задаче - написать метод, вычисляющий длину диагонали ( теорема пифагора )
 */

struct Rect12 {
    /*stored property*/
    let width: Double
    let height: Double
    
    init(width: Double, heightValue: Double) {
        self.width = width
        height = heightValue
    }
    
    func perimeter() -> Double {
        let result = (width + height) * 2
        return result
    }
    
    func area() -> Double {
        let result = width * height
        return result
    }
    
    /*вычисляемое свойство - computed property*/
    
    var description: String {
        let resultString = "В прямоугольнике [\(width) \(height)] - периметр \(perimeter()) площадь - \(area())"
        return resultString
    }
}

let rect12Instance = Rect12(width: 12, heightValue: 11)
let perimeter = rect12Instance.perimeter()
let area = rect12Instance.area()

print("периметер - \(perimeter) площадь - \(area)")
print(rect12Instance.description)

/*Задачка для пытливых*/

/*
 
 https://leetcode.com
 
 1. Гараж, состоит из этажей (массив этажей)
 2. На каждом этаже есть массив парковочных мест
 3. Написать метод у гаража, который паркует тачку. Тачка === строка, в которой номер тачки. Можно тачку сделать отдельной сущностью; метод возвращает структуру с 2 свойствами - номер этажа и номер парковочного места
 4. Написать метод, который возвращает номер тачки по структуре из п.3 - по номеру этажа и месту
 5. у парковочного места должно быть свойство String?, в котором лежит номер припарковоной тачки, если мето занято и nil, если оно свободно
 
гараж - класс, этаж - тоже класс
 в конструктор гаража надо пробросить массив этажей
 
 struct ParkingTiket {
    let level: Int
    let placeId: Int
 }
 
 protocol Algorithm {
    func park(garage: Garage, car: String) -> ParkingTiket?
 }
 */


// Optional type

var value: Int? // optional Int
var value1: Int? = nil // nil = not initialized link

value = 10

func max(left: Int, right: Int) -> Int? {
    if left > right {
        return left
    } else if right > left {
        return right
    } else {
        return nil
    }
}

let result123 = max(left: 12, right: 12)
result123?.byteSwapped

var human: Human? = Human(name: "", age: 0)


///

human?.age // добавляется вопрос если мы обращаемся к свойствам опциональной переменной

let age = human?.age // Int?

// приведение к типу - Int? к Int

/* if - let */

if let human = human {
    // human - не nil
  let x = human.age
} else {
    // human -> nil
}

/* guard let*/

func isLegalAge(human: Human?) -> Bool {
    // early return
    guard let human = human else {
        return false
    }
    
    return human.age >= 18
    
    /*альтернатива*/
    
    //    if let human = human {
    //        return human.age >= 18
    //    } else {
    //        return false
    //    }
}


// bonus track - как не писать конструктор

struct A {
    var a: Int?
    var b: Int?
}
 
var aInstance = A()
aInstance.a = 12
aInstance.b = 13

struct Aa {
    var a = 0
    var b = 0
}

var aaInstance = Aa()
aaInstance.a = 12
aaInstance.b = 13

