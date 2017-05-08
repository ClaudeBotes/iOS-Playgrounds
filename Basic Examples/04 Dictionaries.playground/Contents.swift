//: Collection types - dictionaries.

var items : [String : String] = [:]
var products = [Int : String]()

products[123] = "Product 1"
products[1] = "Red Paint"

products

var states = ["NJ" : "New Jersey", "NY" : "New York", "PA" : "Pennsylvania", "CA" : "California"]

states["NJ"]

states.updateValue("Commonwealth of Pennsylvania", forKey: "PA")

states["PA"]

states.count

states["PA"] = nil

states

for (abbrev, state) in states {
    print("\(abbrev) is short for \(state).")
}

