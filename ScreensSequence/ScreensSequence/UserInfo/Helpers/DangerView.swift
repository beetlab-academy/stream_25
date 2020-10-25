import UIKit

protocol DangerView where Self: UIViewController {
    func validate(closure: () -> Bool) -> Bool
}

extension DangerView {
    /*реализация по умолчанию*/
    func validate(closure: () -> Bool) -> Bool {
        let succes = closure()
        
        if !succes {
            let alert = UIAlertController(title: nil, message: "Заполните все поля!", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
        
        return succes
    }
}
