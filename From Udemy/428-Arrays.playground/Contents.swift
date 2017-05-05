//: Collection Types - arrays.

// indexed         0        1         2
let catNames = ["Guido", "Earl", "Brownie"]

var emptyArray : [String] = []

var dogName = [String]()

dogName.append("Mikey")

dogName += ["Latte", "Bianca"]

dogName.count

dogName[2]

for name in dogName {
    print(name)
}

//dogName.removeAtIndex(2)

dogName

//dogName.removeAll()

dogName.enumerate()

for (index, name) in dogName.enumerate() {
    print("\(index): \(name)")
}

if dogName.isEmpty {
    print("The array is empty")
} else {
    print("There are \(dogName.count) names in the array.")
}