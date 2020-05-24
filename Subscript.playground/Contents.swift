import UIKit

var str = "Hello, playground"

// MARK: - ЗАПОЛНЕНИЕ МАССИВА

let array = [1,3,3,4,5] // статически
let array1 = ["1", "2dsvwg", "sdfsvvr"] // статически

struct SomeStruct {
    let value: Int
    let value1: Int
}

let array2 = [SomeStruct(value: 1, value1: 2), SomeStruct(value: 23, value1: 23)] // статически

let obj1 = SomeStruct(value: 1, value1: 2)
let obj2 = SomeStruct(value: 2, value1: 34)

let array3 = [obj1, obj2] // статически

// MARK: - ЧТЕНИЕ - SUBSCRIPT

// получаем доступ к элементу - SUBSCRIPT
// *имя переменной/аргумент функции, в которой лежит массив*[*целое число*]

array[0]
array1[3]

let index = 10
array1[index]

// MARK: - ЦИКЛЫ

// цикл по индексам

for i in 0..<array1.count {
    let коронавирус = array1[i]
    /*выполняем условие задачи с коронавирус*/
}

// цикл по элементам массива

for хуй in array1 {
    хуй
    /*выполняем условие задачи с element*/
}

let randIndex = Int.random(in: 0..<array1.count)
let randElement = array1[randIndex]

func задачаСПоследнегоЗанятия(array: [Int], incrementor: Int) -> [Int] {
    var outArray = [Int]()
    
    for index in 0..<array.count {
        outArray.append(array[index] + incrementor)
    }
    
    return outArray
}
