//: Collection types - sets.

var teams : Set<String>

var myBills : Set = ["electricity", "water", "heat", "internet", "water"]

myBills.count

myBills.insert("cellphone")

myBills.remove("cellphone")

for bills in myBills {
    print(bills)
}

myBills.removeAll()
myBills = []