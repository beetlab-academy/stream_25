import Cocoa

/*константы и переменные*/

/*
 - let - константа
 - x - имя
 - = - опреатор привоения
 */


let x = 12
let z = x * 123
// x = 12

/*var - признак переменной*/

var y = 1

y = x
y = 11

// операторы
/*
 
 a = b
 
 a, b - операнды
 
 a + b -> тип вычисляется из левого операнда, правый должен быть такого же типа, как и левый
 
 */

y = x + 5
y = x * 5
y = x / 5
y = x % 5 // остаток от деления -> проверка на четность числа (остаток от деления на 2 = 0)
y = x - 5

print(y) // функция печати - print(*то что хотите печатать*)

/*типы констант и переменных*/

let x1: Int = 1
let x2: Double = 1.2000001234 // 12
let x3: String = "ssgerergerg"

//let result = y + x2


/*приведение к типу*/

let result = y + Int(x2) // Int - тип, к которому приводим x2

/* функции */

//fatalError()

/*ключевое слово func*/func /*имя функции*/add /*аргументы функции*/(firstDigit: Int, secondDigit: Int) -> Int {
    /*тело функции*/
    let sum = firstDigit + secondDigit
    /*еще операции, быть может*/
    
    return sum /*возвращаем результат, функция завершает свою работу*/
}


/*варианты вызова*/

// запись результата функции в константу
let sumResult = add(firstDigit: 12, secondDigit: 13) // вызвали функцию, возвращаемое значение записываем в константу sumResult
print(sumResult)

// вызвать прямо внутри print
print(add(firstDigit: 1, secondDigit: 13))

/*формат работы*/

/*если функция ничего не возвращает*/

func f() {
    let x = 10
    print(x)
}

f()

/*если функция возвращает*/
func mul(a: Int, b: Int) -> Int {
    return a * b
}

let mulResult = mul(a: 12, b: 3)
// форматированная печать
print("результат задачи 3 = \(mulResult)")
