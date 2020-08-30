import UIKit

var str = "Hello, playground"

// наша стратегия - инъекция зависимости в свойство

class A {
    var b: B! // injected
}

class B {
    var a: A! // injected
}


// инъекция зависимости в конструктор

class A1 {
    let b: B1
    
    init(b: B1) {
        self.b = b
    }

}

class B1 {
    let a: A1
    
    init(a: A1) {
        self.a = a
    }
}

let a1 = A1(b: <#T##B1#>)
let b1 = B1(a: a1)

// vs

let a = A() // floors
let b = B() // garage
b.a = a
a.b = b

// восклицательный знак

var x: Int? = 0
var x1: Int! = 0

let y: Int = x!
let z: Int = x1
