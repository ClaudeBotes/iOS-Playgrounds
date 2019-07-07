//: Functions - syntax.

func helloThere(name: String) -> String {
    return "Hello there \(name)!"
}

helloThere(name: "People")

func printNumber(number: Int) -> String {
    return "The number given was \(number)."
}

printNumber(number: 345)

func turnOffAppliance(appliance: String, isOn: Bool) {
    
    if isOn {
        print("Please turn off the \(appliance).")
    } else {
        print("I have already turned off the \(appliance).")
    }
    
}

turnOffAppliance(appliance: "oven", isOn: false)
turnOffAppliance(appliance: "television", isOn: true)

func addition(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

addition(number1: 45, number2: 987)

func multiply(num1: Int, num2: Int) -> String {
    let result = "\(num1 * num2)"
    return result
}

multiply(num1: 4567, num2: 8956)

let a = 34
let b = 49

multiply(num1: a, num2: b)

