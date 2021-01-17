import UIKit

var x = 0

/*
 {[var1, var2, var3, ...] (arg1, agr2, agr3,....) -> ReturnType in
 
 // source
 
 }
 
 */

let closure = { /*[x]*/ (a: Int) -> Void in // [] - capture list
    x += a
}

closure(12)

print(x)


class A {
    var x: Int
    var closure: ( ()-> Void )?
    
    init(x: Int) {
        self.x = x
    }
}

var aObj = A(x: 12)

let closure2 = { //[weak aObj] in
    aObj.x += 1
}

aObj.closure = {[weak aObj] in
    aObj?.x += 1
}

closure2()

print(aObj.x)

struct Forecast: Decodable {
    let temp: Float
    let pressure: Float
    let city: String
    
    var description: String {
        "temp: \(temp), pressure: \(pressure) city: \(city)"
    }
}

protocol WeatherForecastService {
    func fetch(citySubstring: String,
               completion: @escaping (Forecast) -> Void)
}

class WeatherForecastServiceImpl: WeatherForecastService {
    var completion: ( (Forecast) -> Void )?
    
    func fetch(citySubstring: String,
               completion: @escaping (Forecast) -> Void) {
        self.completion = completion
        
        let url = URL(string: "https://google.com")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                
//                let response = try JSONDecoder().decode(Forecast.self, from: data)
                completion(Forecast(temp: 1, pressure: 2, city: ""))
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}

class ViewController {
    let label = UILabel()
    var service: WeatherForecastService! // injected
    
    func viewDidLoad() {
        var x = 0
        print("start")
        service.fetch(citySubstring: "Москва") { [weak self] (forecast) in
            x += 1
            print("new x \(x) \(self)")
            self?.label.text = forecast.description
        }
        print("view did load dead")
    }
}

let vc = ViewController()
vc.service = WeatherForecastServiceImpl()

vc.viewDidLoad()
print("scope ended")
