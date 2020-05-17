import UIKit

var str = "Hello, playground"

/*классы*/

/*
 Военкомат
 
 - дом - структура, состоит из квартир
 - в каждой квартире проживает массив граждан
 
 - военкомат - класс, у которого в свойстве массив домов
 - метод призыва в вс, он должен забрать совершеннолетних граждан из их квартир
 */

/*
 Область видимости - файл
 
 var1, let1 - определены
 
 {
    var1, let1 - видны
    var2, let2 - определены
    {
        var1, let1 - видны
        var2, let2 - видны
        var3, let3 - определены
        {
            var1, let1 - видны
            var2, let2 - видны
            var3, let3 - видны
        }
    }
   
    {
        
    }
 
    var1, let1 - видны
    var2, let2 - видны
    var3, let3 - не видны
 }
 */

enum Sex {
    case male
    case female
    case undefined
}

struct Citizen {
    let name: String
    let age: Int
    let sex: Sex
}

/*протокол - описывает интерфейс*/

protocol Recrutable {
    func recruits() -> [Citizen]
}

class Flat: Recrutable {
    var family: [Citizen] /*зависимость*/
    
    init(family: [Citizen]) {
        self.family = family
    }
    
    func recruits() -> [Citizen] {
        var recruitsIndexes = [Int]()
        
        for (index, human) in family.enumerated() {
            if human.sex == .male && human.age > 17 && human.age < 28 {
                recruitsIndexes.append(index)
            }
        }
        
        var humanArray = [Citizen]()
        
        for index in recruitsIndexes {
            humanArray.append(family[index])
            family.remove(at: index)
        }
        
        return humanArray
    }
}

class House: Recrutable {
    var flats: [Flat] /*зависимость*/
    
    init(flats: [Flat]) {
        self.flats = flats
    }
    
    func recruits() -> [Citizen] {
        var outArray = [Citizen]()
        
        for flat in flats {
            outArray.append(contentsOf: flat.recruits())
        }
        
        return outArray
    }
}

/*реализация протокола - через двоеточие дописали и реализовали методы этого протокола*/
class Военкомат: Recrutable {
    var houses: [House]
    
    init(houses: [House]) {
        self.houses = houses
    }
    
    func recruits() -> [Citizen] {
        var outArray = [Citizen]()
        
        for house in houses {
            outArray.append(contentsOf: house.recruits())
        }
        
        return outArray
    }
}

/*
 схема зависимостей
 
 Военкомат >------* House >-----* Flat >-----* Citizen
 
 */

let family1 = [Citizen(name: "петя", age: 19, sex: .male), Citizen(name: "ириной", age: 19, sex: .female)]
let family2 = [Citizen(name: "андрей", age: 19, sex: .male), Citizen(name: "яков", age: 19, sex: .undefined)]
let family3 = [Citizen(name: "антонина", age: 19, sex: .female), Citizen(name: "ириной", age: 19, sex: .female)]

let flat1 = Flat(family: family1)
let flat2 = Flat(family: family2)
let flat3 = Flat(family: family3)

let house1 = House(flats: [flat1, flat2])
let house2 = House(flats: [flat3])

let военкомат = Военкомат(houses: [house1, house2])
военкомат.recruits()
военкомат.houses


func recruit(recruitable: Recrutable) {
    let recruits = recruitable.recruits()
    
    for recruit in recruits {
        print("призывник \(recruit.name) - \(recruit.age)")
    }
}

/*благодаря протоколу мы можем вызывать функцию от объектов разных типов, ибо у них имеется одинковый интерфейс - Recruitable*/

recruit(recruitable: военкомат)
recruit(recruitable: house1)
recruit(recruitable: flat1)

/*интерфейсы*/

/*
 Obj {
    protocol1 {
    }
    protocol2 {
    }
    protocol3 {
    }
    protocol4 {
    }
 
    var, let, func
}
 
 У объекта интерфейсы:
 Obj, protocol1, protocol2, protocol3...
 */

protocol Algo {
    func algoPark()
}

class Garage {
    var algo: Algo! // injected
    
    func park() {
        algo.algoPark()
    }
}

class Algo1: Algo {
    func algoPark() {
        
    }
    
}

class Algo2: Algo {
    func algoPark() {
        
    }
    
}

let garageInstance = Garage()
garageInstance.algo = Algo1() /*инъекция зависимости*/
