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
            
        }
    }
    return perimeter
}

let triangle = [Point(x: 0, y: 0), Point(x: 0, y: 3), Point(x: 9, y: 0)]

distanceBetween(first: Point(x: 0, y: 0), second: Point(x: 9, y: 0))

let p = perimeter(shape: triangle)
