import UIKit

/*
 - типы + Bool
 - иф элсы и их комбинации и работу с функциями, внутри иф элсы
 - массивы и циклы
 */

/*
Int
String
Float / Double
*/

let x: Bool = true

/*
&& // оператор `И` a.k.a * для чисел
|| // оператор `ИЛИ` + для чисел
 ! // оператор отрицания - стрелка пирса
*/

let y = false

let result = x && y
let result1 = x || y
let result2 = !x

/*
 &&
 x y result
 1 0 0
 1 1 1
 0 1 0
 0 0 0
 
 
 ||
 x y result
 1 0 1
 1 0 1
 0 1 1
 0 0 0
 
 1 - true
 0 - false

 */

/*Операторы возвращают Bool
 
 != - не равно
 == - равно
 
 >, <, >=, <=, !=, ==
 
 */

let a = 1
let b = 2

let result3 = a > b
let result4 = a == b

let str1 = "hello"
let str2 = "world"

let resultStr = str1 + " " + str2

// if else

//if /*логическое выражение*/ {
//    // код - логическое выражение - true
//} else {
//   // код - логическое выражение - false
//}
//

let digit = 13

if digit % 2 == 0 {
    print("четное")
} else {
    print("нечетное")
}

if digit % 2 == 0 {
    print("четное")
} /*else не обязателен!!!*/

// scope переменных

//{ /*1*/ { /*2*/ {/*3*/} } }

// в 3 видны переменные из 1 и 2, 2 только 1,  в 1 только те переменные, которые определены за контекстом 1
func isOdd(digit: Int) -> Bool {
    let reminder = digit % 2
    
    if reminder == 0 {
        print("четное \(reminder)")
        let z = 0
        if digit > 7 {
            let v = 0
            print("число больше 7 \(z)")
        }
        
        // v не видно
        
        return false
    } else {
        print("нечетное")
        return true
    }
}

//

func canDivide(digit: Int) {
    if digit % 2 == 0 {
        print("четное")
    } else if digit % 2 != 0 && digit % 3 == 0 {
        print("нечетное и делится на 3")
    } else if digit % 2 != 0 || digit % 3 == 0 {
        print("нечетное или делится на 3")
    }
    else {
        print("ничего не можем сказать")
    }
}

canDivide(digit: 9)

/*
 if /*выражение*/ {
 } else if /*выражение*/ {
 }
 ....
 else { <--- опциональный
 }
 
 гарантированно выполнится только 1 условие
 */

func a1() {
    // чет полезное
}

func b2() {
    a1()
}

let dobleVar: Double = 23.4
let intVar: Int = 34

let sum = dobleVar + Double(intVar)/*приведение к типу*/

/* массивы */

// |1|2|3|23|0|-9|12|11|100|98|
let array: [Int] = [1, 2, 4, 23, 0, -9, 12, 11, 100, 98]
// пустой массив: []

/* матрица
 [1,2]
 [2,4]
 */
let matrix: [ [Int] ] = [[1,2], [2,4]]

//для пытливых - функция, принимает матрицу на вход и её транспонирует

func transpond(matrix: [[Int]]) -> [[Int]] {
    return []
}

func multiple(matrix: [[Int]], row: [Int]) -> [Int] {
    return []
}

// операции над массивами

//1. статическая инициализация
let arrayStatic: [Int] = [1, 2, 4, 23, 0, -9, 12, 11, 100, 98]
print(arrayStatic)

//2. динамическая инициализация
var arrayDynamic: [Int] = [] // в первый момент времени - пустой массив
arrayDynamic.append(12)
arrayDynamic.append(13)
print(arrayDynamic)

// обращение к элементам массива - элементы массива пронумерованы с 0

let element = arrayStatic[8]
print(element)
arrayDynamic[0] = 3
print(arrayDynamic)
let elementToRemove = arrayDynamic.remove(at: 0)
print("\(elementToRemove) \(arrayDynamic)")

// типичная задача на массивы из дз

func doSmth(input: Int) -> [Int] {
    var emptyArray: [Int] = []
    
    // наполняете массив
    
    return emptyArray
}

func filterArray(input: [Int]) -> [Int] {
    var copy = input // создаем копию, которая var
    
    // операции над copy
    
    return copy
}

// циклы

for i in 0...100 {
    var x = 0
    x += i // x = x + i
    print("i = \(i) x = \(x)")
}

var sum1 = 0
var oddDigitsCounter = 0

for ывромишрм in 0...100 {
    sum1 += ывромишрм // x = x + i
    print("i = \(ывромишрм) x = \(sum1)")
    
    // сумма нечётных чисел в интервале от 0 до 100
    
    if ывромишрм % 2 != 0 {
        oddDigitsCounter += ывромишрм
    }
}

print("итого - \(sum1) \(oddDigitsCounter)")

// найти все нечётные числа от 3 до 1234

func oddDigitsInIntervalFrom3Til1234() -> [Int] {
    var emptyArray: [Int] = []
    
    for i in 3...1234 {
        if i % 2 != 0 {
            emptyArray.append(i)
        }
    }
    
    // наполняете массив
    
    return emptyArray
}

let result5 = oddDigitsInIntervalFrom3Til1234()
print(result5)

// опреации над массивом в цикле

arrayStatic[0]
arrayStatic[1]
//arrayStatic[10] ->  ошибка out of range (такого индекса нету в массиве).

arrayStatic.count // длина массива - количество элементов

let array2 = [3, 13, 23, 45]

// индекс === порядковый номер элемента массива

for i in 0..<array2.count {
    let index = i
    let element = array2[index]
    print("индекс - \(index) элемент - \(element)")
}

// найти порядковые номера элементов массива, превышающие второй входной аргумент

func filter(array: [Int], upperBound: Int) -> [Int] {
    var emptyArray = [Int]() // второй способ помимо  var emptyArray: [Int] = []
    
    for i in 0..<array.count {
        if array[i] > upperBound {
            emptyArray.append(i)
        }
    }
    
    return emptyArray
}

let aaray = [34, 1, 4 , 10]
let upperBound = 4

let indexes = filter(array: aaray, upperBound: upperBound)
print("массив - \(aaray) верхняя граница - \(upperBound) индексы - \(indexes)")

// массив - [34, 1, 4, 10] верхняя граница - 4 индексы - [0, 3]

var array14 = [1,3,4,5]

// итерация по массиву без индекса элементов
for element in array14 {
    print("\(array14) \(element)")
}

// vs

// с индексом
for i in 0..<array14.count {
    print("\(array14) \(i) \(array14[i])")
}
