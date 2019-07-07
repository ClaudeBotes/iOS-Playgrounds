// Setup playground environment
var bankBalance : Double = 1000
var bankIsAvailable = false

// Declare a custom error type
enum BankingError : Error {
    case InsufficientFunds
    case BankNotAvailable(reason: String)
}

// Declare a function which throw a custom error type
func withdrawl(amount: Double) throws -> Double {
    
    guard bankIsAvailable == true else {
        throw BankingError.BankNotAvailable(reason:"Systems down. Please try again in 20 minutes.")
    }
    
    guard bankBalance > amount else {
        throw BankingError.InsufficientFunds
    }
    
    bankBalance = bankBalance - amount
    
    return bankBalance
}

// Handle errors
func handleError(processError error: BankingError) {
    let prefix = "Process Failed."
    switch error {
    case .InsufficientFunds:
        print("\(prefix) Insuficient funds.")
    case .BankNotAvailable:
        print("\(prefix) Systems down, please try again in 20 minutes.")
    default:
        print(prefix)
    }
}

// Call function which may throw custom error type
do {
    var newBalance = try withdrawl(amount: 1200)
    print("New balance is $\(newBalance)")
}catch let error as BankingError {
    handleError(processError: error)
} catch {
    print("An unkown error took place. Please try again later.")
}
