import Foundation
import UIKit

extension Date {
    
    /**
     Returns a timestamp for a date in string format.
     
     - parameters:
     - stringDate: The date in string format. Example: 26-04-2019 22:00:00
     
     String date format has to be in: dd-MM-yyyy HH:mm:ss
     */
    public static func GetTimeStampFromString(stringDate: String) -> TimeInterval{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let newDate = dateFormatter.date(from: stringDate)
        
        let timestamp = newDate?.timeIntervalSince1970
        
        return timestamp!
    }
    
    /**
     Returns true or false whether the date provided falls in the current week.
     
     - parameters:
     - date: Date to be validated.
     */
    public static func DateFallsInCurrentWeek(date: Date) -> Bool {
        let currentWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: Date())
        let datesWeek = Calendar.current.component(Calendar.Component.weekOfYear, from: date)
        return (currentWeek == datesWeek)
    }
    
    /**
     Returns a readable date without its time
     
     Example: Tomorrow, Yesterday, Today, 12 April 2019
     
     - parameters:
     - timestamp: timestamp to be validated.
     */
    public static func GetReadableDateWithoutTime(timeStamp: TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        
        if Calendar.current.isDateInTomorrow(date) {
            return "Tomorrow"
        } else if Calendar.current.isDateInYesterday(date) {
            return "Yesterday"
        } else if Date.DateFallsInCurrentWeek(date: date) {
            if Calendar.current.isDateInToday(date) {
                return "Today"
            } else {
                dateFormatter.dateFormat = "EEEE"
                return dateFormatter.string(from: date)
            }
        } else {
            dateFormatter.dateFormat = "d MMMM yyyy"
            return dateFormatter.string(from: date)
        }
    }
    
    /**
     Returns a value for how long ago or since the given date.
     
     Example: 5 seconds ago, 3 weeks ago, 1 year ago etc.
     
     - parameters:
     - date: Date at which the event took place.
     */
    public static func TimeAgoDisplay(date: Date) -> String {
        
        let secondsAgo = Int(Date().timeIntervalSince(date))
        
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
