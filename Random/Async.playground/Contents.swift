import Foundation

@objc class SayTime {
    var count = 0
    
    func sayOne(timer: NSTimer!) {
        count++
        NSLog("One second!")
        if count == 15 {
            NSLog("Fifteen seconds")
            timer.invalidate()
            exit(0)
        }
    }
    
    func sayFive(timer: NSTimer!) {
        NSLog("Five seconds!")
    }
    
    func sayTen(timer: NSTimer!) {
        NSLog("Ten seconds!")
    }
}

let hello = SayTime()
let timer1 = NSTimer(timeInterval: 1.0,
    target: hello,
    selector: "sayOne:",
    userInfo: nil,
    repeats: true)
let timer2 = NSTimer(timeInterval: 10.0,
    target: hello,
    selector: "sayTen:",
    userInfo: nil,
    repeats: false)
let timer3 = NSTimer(timeInterval: 5.0,
    target: hello,
    selector: "sayFive:",
    userInfo: nil,
    repeats: false)
NSRunLoop.currentRunLoop().addTimer(timer1, forMode: NSDefaultRunLoopMode)
NSRunLoop.currentRunLoop().addTimer(timer2, forMode: NSDefaultRunLoopMode)
NSRunLoop.currentRunLoop().addTimer(timer3, forMode: NSDefaultRunLoopMode)
NSRunLoop.currentRunLoop().run()
