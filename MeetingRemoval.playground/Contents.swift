import UIKit

var str = "Hello, playground"

struct Smth1 {
    
}

struct Smth {
    let id: String
    let prop1: Int
    let prop2: [Smth1]
}

class Scheduler {
    var smthArray = [Smth]()
    
    func change(prop1: Int, id: String) {
        var index = -1
        
        for i in smthArray {
            // присвоить index нужный i
        }
        
        if index != -1 {
            let obj = smthArray[index]
            let newObj = Smth(id: id, prop1: prop1, prop2: obj.prop2)
            smthArray[index] = newObj
        }
    }
}
