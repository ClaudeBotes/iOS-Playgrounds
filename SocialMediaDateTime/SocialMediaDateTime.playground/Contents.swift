//: Playground - noun: a place where people can play

import UIKit

let nowWithSeconds = Date().description
let pastDateWithSeconds = Date(timeIntervalSinceNow: -5).description

let now = Date()
let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24 * 7)

extension Date {
    
    func timeAgoDisplay() -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        var timeAgoSuffix = ""
        
        switch secondsAgo {
        case let x where x < minute:
            
            if(x > 1 || x == 0){
                timeAgoSuffix = " seconds ago"
            }else{
                timeAgoSuffix = " second ago"
            }
            
            return "\(secondsAgo)" + timeAgoSuffix
            
        case let x where x < hour:
            
            if(x > minute){
                timeAgoSuffix = " minutes ago"
            }else{
                timeAgoSuffix = " minute ago"
            }
            
            return "\(secondsAgo / minute)" + timeAgoSuffix
            
        case let x where x < day:
            
            if(x > hour || x != hour){
                timeAgoSuffix = " hours ago"
            }else{
                timeAgoSuffix = " hour ago"
            }
            
            return "\(secondsAgo / hour)" + timeAgoSuffix
            
        case let x where x < week:
            
            if(x > day || x != day){
                timeAgoSuffix = " days ago"
            }else{
                timeAgoSuffix = " day ago"
            }
            
            return "\(secondsAgo / day)" + timeAgoSuffix
            
        case let x where x >= week:
            
            //TODO: refactor code to 2 weeks and 4 days ago
            
            if(x > week){
                timeAgoSuffix = " weeks ago"
            }else if (x == week){
                timeAgoSuffix = " week ago"
            }
            
            return "\(secondsAgo / week)" + timeAgoSuffix

        default:
            return "na"
        }
    }
}

pastDate.timeAgoDisplay()
