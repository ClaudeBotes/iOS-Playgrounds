//: Collection types - tuples (unofficially)

let productIndex = [123 : "Bananas", 256 : "Apples", 753 : "Grapes", 967 : "Pears"]

for (sku, product) in productIndex {
    print("The sku for \(product) is \(sku).")
}

let tuple1 = ("Jason", 40, 12.99, true)

tuple1.0

func getCarDetails() -> (String, Int, Bool) {
    let name = "Camaro"
    let speed = 140
    let isConvertable = true
    
    return (name, speed, isConvertable)
}

let car = getCarDetails()

car.0
car.1
car.2

let (name, mph, top) = getCarDetails()

name
mph
top

print("The \(name) can go at least \(mph) mph.")

