import UIKit

var str = "Hello, playground"

//  ----- default - protocols ------//

protocol Callback {
    func done()
}

class Logic {
    var callback: Callback! // injected
    
    func run() {
        //
        
        callback.done()
    }
}

class CallbackImpl: Callback {
    func done() {
        
    }
}

let obj = Logic()
obj.callback = CallbackImpl()

//----------------------------------------//

// () -> Void
let closure: () -> Void = {
    print("closure!!!")
}

closure()

// 1 вариант - колбек в аргумент функции
class ClosureLogic {
    func run(callback: ()-> Void) {
        //
        
        callback()
    }
}

// 2 вариант - колбек в cвойство
class ClosureLogic1 {
    var callback: ( ()-> Void )!
    
    func run() {
        //
        
        callback()
    }
}


let obj1 = ClosureLogic()
let callback = {
    print("callback1")
}

obj1.run(callback: callback)
obj1.run(callback: {
    print("callback1")
})
obj1.run {
    print("callback1")
}

let obj2 = ClosureLogic1()

let callback1 = {
    print("callback1")
}

obj2.callback = callback1

obj2.callback = {
    print("callback1")
}


obj2.run()

let closure2: (Int, Int) -> Int = {
    return $0 + $1
}


// почему замыкание так называется

let a = 0
let b = 10

let closure4 = { () -> Int in
    let x = a + b
    return x
}


// https://swiftbook.ru/content/languageguide/closures/

/*
 1. колбеки
 2. операции над коллекциями
 */

// операции над коллекциями

let array = [3,4,56,78,9,6,3,15]
let outArray = array.filter { (element: Int) -> Bool in
    return element % 2 != 0
}

let outArray1 = array.filter { $0 % 2 != 0 }
let outArray2 = array.reduce(0) { (prevResult, currentElement) -> Int in
    return prevResult + currentElement
}

let outArray3 = array.reduce(1) {
    if $1 % 2 != 0 {
        return $0 * $1
    } else {
        return $0
    }
}

let outArray4 = array.sorted { (prevElement, nextElement) -> Bool in
    prevElement < nextElement
}

let outArray5 = array.sorted { $0 > $1 }

let elemnt = array.first { $0 % 2 != 0 }
let elemntIndex = array.firstIndex { $0 % 2 != 0 }
let ifContains = array.contains { $0 % 2 != 0 }

// protocol Comparable, protocol Equitable (array.contains(1))
// коллбеки

protocol Storage {
    func set(value: String)
    func value()
}

class Module1Assembly {
    func viewController(callback: (String, UIViewController)-> Void) -> UIViewController {
        UIViewController()
    }
}

class Module2Assembly {
    func viewController(callback: ()-> Void) -> UIViewController {
        UIViewController()
    }
}


class AppCoordinator {
    var storage: Storage! // injected
    
    func run(window: UIWindow) {
        let vc1 = Module1Assembly().viewController { (token, viewController) in
            self.storage.set(value: token)
            self.presentNext(on: viewController)
        }
        
        window.rootViewController = vc1
    }
    
    func presentNext(on viewController: UIViewController) {
        let vc2 = Module2Assembly().viewController {         }
        viewController.present(vc2, animated: true) {
            //
        }
    }
}

let url = URL(string: "https://www.google.com/search?sxsrf=ALeKk01Y8cJihkM6-5jc4zjwI1fQFlrmgg%3A1608464233911&ei=aTffX5SGN7HMrgT63q-gDg&q=weather+forecast+json+api+example&oq=weather+forecast+json+api+example&gs_lcp=CgZwc3ktYWIQAzIFCCEQoAE6BAgAEEc6BggAEBYQHjoICCEQFhAdEB5Q0VBYoFxg0l9oAHACeAGAAWiIAaoEkgEDNS4xmAEAoAEBqgEHZ3dzLXdpesgBCMABAQ&sclient=psy-ab&ved=0ahUKEwjU3q6avNztAhUxposKHXrvC-QQ4dUDCA0&uact=5")!

let request = URLSession.shared.dataTask(with: url) { (data, response, error) in
    print("\(data?.count)")
}

request.resume()

protocol NetworkClient {
    func get(url: URL, completion: @escaping (Data?, Error?)-> Void) // escaping!!!
}

// Codable -> Coding Keys, DispatchQueue

class NetworkClientImpl: NetworkClient {
    func get(url: URL, completion: @escaping (Data?, Error?)-> Void) {
        let request = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }

        request.resume()

    }
}
