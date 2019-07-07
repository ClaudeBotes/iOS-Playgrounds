//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

class SayTime {
    var count = 0
    
    @objc func sayOne(timer: Timer!) {
        count = count + 1
        NSLog("One second!")
        if count == 15 {
            NSLog("Fifteen seconds")
            timer.invalidate()
            exit(0)
        }
    }
    
    @objc func sayFive(timer: Timer!) {
        NSLog("Five seconds!")
    }
    
    @objc func sayTen(timer: Timer!) {
        NSLog("Ten seconds!")
    }
}

let hello = SayTime()
let timer1 = Timer(timeInterval: 1.0,
    target: hello,
    selector: #selector(hello.sayOne),
    userInfo: nil,
    repeats: true)

let timer2 = Timer(timeInterval: 10.0,
    target: hello,
    selector: #selector(hello.sayTen),
    userInfo: nil,
    repeats: false)

let timer3 = Timer(timeInterval: 5.0,
    target: hello,
    selector: #selector(hello.sayFive),
    userInfo: nil,
    repeats: false)

RunLoop.current.add(timer1, forMode: .common)
RunLoop.current.add(timer2, forMode: .common)
RunLoop.current.add(timer3, forMode: .common)
//RunLoop.current.run()

