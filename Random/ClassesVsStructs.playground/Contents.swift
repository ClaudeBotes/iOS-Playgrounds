//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/********************************************************/
print("Struct Playfield")
/*                                                      */
/* Structures are value types, meaning a new copy is    */
/* created and stored in memory                         */
/********************************************************/

struct StructPerson {
    
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    var Name: String {
        get{
            return self.name
        }
        
        set(newName){
            name = newName
        }
    }
    
}

var structPersonOne = StructPerson(name: "Claude")
print(structPersonOne.name)
structPersonOne.Name = "Charlie"
print(structPersonOne.name)

var structPersonTwo = structPersonOne
print(structPersonTwo.name)
print(structPersonOne.name)
structPersonTwo.Name = "Jonell"
print(structPersonTwo.name)
print(structPersonOne.name)


/*******************************************************/
/* Class Playfield                                     */
print("Class Playfield")
/*                                                      */
/* Structures are value types, meaning a new copy is    */
/* created and stored in memory                         */
/********************************************************/

//Classes are reference types, meaning pointers to a location in memory
class ClassPerson {
    
    var name : String
    
    init(name : String){
        self.name = name
    }
    
    var Name: String {
        get{
            return self.name
        }
        
        set(newName){
            name = newName
        }
    }
    
}

var personOne = ClassPerson(name: "Claude")
print(personOne.name)
personOne.Name = "Charlie"
print(personOne.name)

var personTwo = personOne
print(personTwo.name)
print(personOne.name)
personTwo.Name = "Jonell"
print(personTwo.name)
print(personOne.name)





