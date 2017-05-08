//: Error throwing functions.

func greeting(person: [String: String]) {
    // Guard syntax
    guard let name = person["firstname"] else {
        return
    }
    
    print("Hello there \(name)")
}

greeting(person: ["firstname" : "Claude"])

// --> Error throwing

var bankBalance : Double = 1000
var bankIsAvailable = false

enum BankingError : Error {
    case InsufficientFunds
    case BankNotAvailable
}

func withdrawl(amount: Double) throws -> Double {
    
    guard bankBalance > amount else {
        throw BankingError.InsufficientFunds
    }
    
    guard bankIsAvailable == true else {
        throw BankingError.BankNotAvailable
    }
    
    bankBalance = bankBalance - amount
    
    return bankBalance
}


do {
    var newBalance = try withdrawl(amount: 120)
    print("New balance is $\(newBalance)")
} catch BankingError.InsufficientFunds {
    print("There are not enough funds in your account.")
} catch BankingError.BankNotAvailable {
    print("The banking system is down.")
} catch {
    print("Unkown error")
}






