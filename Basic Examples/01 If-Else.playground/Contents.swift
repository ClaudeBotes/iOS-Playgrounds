//: Control flow - if/else

var x = 82

if x == 67 {
    print("x = 67")
} else if x <= 50 {
    print("x is less than 50")
} else {
    print("the value does not match")
}

if x != 100 {
    print("x is \(x), not 100.")
} else {
    print("x = 100")
}

if x == 78 && x <= 100 {
    print("x = 78 and is less than 100")
}

if x <= 70 || x >= 80 {
    print("x is within range")
} else {
    print("x is not within range")
}