import UIKit

var str = "Hello, playground" // стек (прочитать https://developer.apple.com/videos/play/wwdc2016/416/)

func f1() {
    let y = 3 // стек
}

func f2() {
    let x = 1 // стек
    f1()
}

f2()

/*
 
main.swift

// str < -- line 15 str уходит из стека
f2()
 // x <---- уходит из стека
 f1()
 // y <--- уходит из стека
 */

//  int *a

/*
 
 int *somth(int x)
 {
    int resutlt = 100;
    return &result;
 }
 
 vs
 
 int somth(int x)
 {
    int resutlt = 100;
    return result;
 }
 
 // //
 
 int *result = somth(1);
 *result // seg fault
 
 vs
 
 int result = somth(1);
 result += 3
 */

/*  табличка - описано, какие адреса заняты */

class Storage {
    func store() {
        
    }
    
    func load() -> Any? {
        nil
    }
}


class ViewController1 {
    var storage: Storage! // injected
}

class ViewController2 {
    var storage: Storage! // injected
}

class ViewController3 {
    var storage: Storage! // injected
}

class StorageAssembly {
    static let shared = Storage()
    var storage: Storage {
        StorageAssembly.shared
    }
}

class Assembly {
    var vc1: ViewController1 {
        let vc1 = ViewController1()
        vc1.storage = StorageAssembly().storage
        return vc1
    }
    
    var vc2: ViewController2 {
        let vc2 = ViewController2()
        vc2.storage = StorageAssembly().storage
        return vc2
    }
}

// оператор присвоения, работая с value типами их копирует, потому что value типы
// передаются только по значению!!!!

/*
 ссылка === адрес
 stack - хранит адрес переменной в куче  (Int64)
 heap - хранит байты переменной (ее значение)

 */

struct A {
    let prop: A
}

struct Node {
    let left: Node?
    let right: Node?
}

class Node1 {
    let left: Node1?
    let right: Node1?
}


/*
    node (root)
    /   \
  node  node
 /   \
 **/

class Smclass {
    
}

func g() {
    let x = Smclass()
}

g()

/*
 void f()
 {
    int *array = malloc(12, sizeof(int));
    ////
    free(array);
 }
 
 Obj *obj = [[Obj alloc] init];
 [obj retain];
 
 obj.method()
 [obj method]
 
 [obj release];
 
 1. retain() // погодите, объект используется, счетчик ссылок на объект увеличить на 1
 2. release() // уменьшаем счетчик ссылок на 1 (если при очередном вызове release счетчик ссылок 0 - то вызывается free()
 3. autorelease() // нужна для такого:
 
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/MemoryMgmt/Articles/MemoryMgmt.html
 
 
 @autoreleasepool {
 func f() -> Obj <=== autorelease
 
 }
 // autorelease объекты сдохли
 
 func buildObj() -> Obj {
    let obj = Obj()
    obj autorelease
    return obj
 }
 
  buildObj().prop
 
 while(true) {
    autorelease {
    // поиск респондеров
    // вызов IBAction
    // present/ dismiss
    }
 }
 */

// https://medium.com/@prafullkumar77/ios-run-loop-what-why-when-7febead400b7

/*
 https://developer.apple.com/library/archive/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011226
 
 
 vc1 -> storage <-vc2
 |
 coord
 
 ARC
 
 */

// БАЗАР ДАЛЬНЕЙШИЙ ИДЕТ ТОЛЬКО ПРО REFERENCE TYPE

class X1 {
    
}

var x = X1() // retain - счетчик ссылок увеличился на 1
weak var y = X1() // ничего - счетчик ссылок не увеличился

// вывод: объект удалится из памяти, когда на него не будет ни одной сильной ссылки
/*
 - массив
 - стековые переменные
 - свойства (без weak)
 - словарь
 - сет
 */

// RETAIN CYCLE

class B1 {
    weak var a: A1!
}

class A1 {
    let b: B1
    
    init(b: B1) {
        self.b = b
    }
}

let b1 = B1()
let a1 = A1(b: b1)
b1.a = a1

class WeakBox {
    weak var value: C?
}

class WeakBox1<T: AnyObject> {
    weak var value: T?
}

class C {
    var cArray = [WeakBox]()
    
    func g() {
        let box = WeakBox()
        box.value = self
        cArray.append(box)
    }
}

protocol Callback: class {
    
}

class Worker {
    weak var callback: Callback?
}


let worker = Worker()
worker.callback = self

self.worker = worker
 
