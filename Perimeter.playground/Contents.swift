import UIKit

var str = "Hello, playground"

/*Написать функцию, определяющую периметр многоугольника*/

struct Point {
    let x: Double
    let y: Double
}

func distanceBetween(first: Point, second: Point) -> Double {
    let sqx = pow(fabs(first.x - second.x), 2)
    let sqy = pow(fabs(first.y - second.y), 2)
    
    return sqrt(sqx + sqy)
}

// написать функцию, определяющую периметр формы
func perimeter(shape: [Point]) -> Double {
    /*тут пишем исходник!!*/
    
    var perimeter: Double = 0
    
    for i in 0..<shape.count {
        let currentPoint = shape[i]
        if i + 1 < shape.count {
            let nextPoint = shape[i+1]
            let distance = distanceBetween(first: currentPoint, second: nextPoint)
            perimeter += distance
        } else {
            let zeroPoint = shape[0]

            let distance = distanceBetween(first: currentPoint, second: zeroPoint)
            perimeter += distance
        }
    }
    return perimeter
}

let triangle = [Point(x: 1, y: 0), Point(x: 0, y: 3), Point(x: 9, y: 0)]

distanceBetween(first: Point(x: 0, y: 0), second: Point(x: 9, y: 0))

let p = perimeter(shape: triangle)

struct Hui {
    let value1: Int
    let value2: Int
    let value3: Int
    
    static func >(left: Hui, right: Hui) -> Bool {
        return left.value1 > right.value1
    }
}

struct Human {
    let name: String
    let age: Int
    
    static func >(left: Human, right: Human) -> Bool {
        return left.age > right.age
    }
    
    static func +(left: Human, right: Human) -> Human {
        return Human(name: left.name + right.name, age: 0)
    }
    
    static func +(left: Human, right: Int) -> Human {
        return Human(name: left.name, age: left.age + right)
    }
}

let h = Human(name: "sderg", age: 10)
let newH = h + 12

func max(array: [Hui]) -> Hui {
    var tempMax = array[0]
    
    for i in 1..<array.count {
        if array[i].value1 > tempMax.value1 {
            tempMax = array[i]
        }
    }
    
    return tempMax
}


func max(array: [Int]) -> Int {
    var tempMax = array[0]
    
    for i in 1..<array.count {
        if array[i] > tempMax {
            tempMax = array[i]
        }
    }
    
    return tempMax
}
