//: [Previous](@previous)

import Foundation

// ***********************
// Test:
// Date extention method: GetTimeStampFromString()
//
// Expected:
// Return a timestamp for a given date string

let twentySixAprilString = "26-04-2019 22:00:00"
Date.GetTimeStampFromString(stringDate: twentySixAprilString)
// ***********************

// ***********************
// Test:
// Date extention method: GetReadableDateWithoutTime()
//
// Expected:
// Change "26-04-2019 22:00:00" to "26 April 2019"

let timstamp = Date.GetTimeStampFromString(stringDate: twentySixAprilString)
Date.GetReadableDateWithoutTime(timeStamp: timstamp)

// Expected:
// Get output of "Today"
Date.GetReadableDateWithoutTime(timeStamp: Date().timeIntervalSince1970)

// Expected:
// Get output of "Tomorrow"
let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
let tomzTimestamp = tomorrow.timeIntervalSince1970
Date.GetReadableDateWithoutTime(timeStamp: tomzTimestamp)

// Expected:
// Get output of "Yesterday"
let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
let yestTimestamp = yesterday.timeIntervalSince1970
Date.GetReadableDateWithoutTime(timeStamp: yestTimestamp)
// ***********************


// ***********************
// Test:
// Date extention method: TimeAgoDisplay()
//
// Expected:
// To get a social media style date. Gives you the time since the date. Useful in posts

Date.TimeAgoDisplay(date:yesterday)
let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -14, to: Date())!
Date.TimeAgoDisplay(date:oneWeekAgo)

