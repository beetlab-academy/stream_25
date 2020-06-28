import UIKit

var str = "Hello, playground"

/// central bank stuff

protocol TransactionsService {
    func f()
}

class CentralBank {
    static let instance = CentralBank()
    
    var banks: [Interbanking] = []
}

extension CentralBank: TransactionsService {
    func f() {
    }
}

/// bank stuff
protocol Interbanking {
    func f()
}

protocol ClientService {
    func g()
}

class Bank: Interbanking {
    var service: TransactionsService! // injected
    
    func f() {}
}
    
extension Bank: ClientService {
    func g() {
    }
}


class CBAssembly {
    var service: TransactionsService {
        return CentralBank.instance
    }
    
    var centralBank: CentralBank {
        return CentralBank.instance
    }
}

class BankAssembly {
    private lazy var cbAssembly = CBAssembly()
    
    func bank() -> ClientService {
        let bank = Bank()
        bank.service = cbAssembly.service
        cbAssembly.centralBank.banks.append(bank)
        
        return bank
    }
}


// main.swift

let bank1 = BankAssembly().bank()
let bank2 = BankAssembly().bank()

bank1.g()
bank2.g()
