import UIKit

let currentDate = Date()

let dateFormatter = DateFormatter()

// Setting the locale.
dateFormatter.locale = NSLocale.current
//dateFormatter.locale = NSLocale(localeIdentifier: "el_GR")
//dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR")


//
// CONVERTING FROM NSDATE TO STRING AND FROM STRING TO NSDATE
//
// All the available date formatter styles.
// Full style.
dateFormatter.dateStyle = DateFormatter.Style.full
var convertedDate = dateFormatter.string(from: currentDate)

// Long style.
dateFormatter.dateStyle = DateFormatter.Style.long
convertedDate = dateFormatter.string(from: currentDate)

// Medium style.
dateFormatter.dateStyle = DateFormatter.Style.medium
convertedDate = dateFormatter.string(from: currentDate)

// Short style.
dateFormatter.dateStyle = DateFormatter.Style.short
convertedDate = dateFormatter.string(from: currentDate)


// Setting custom date formats.
dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
convertedDate = dateFormatter.string(from: currentDate)

dateFormatter.dateFormat = "HH:mm:ss"
convertedDate = dateFormatter.string(from: currentDate)


// Converting from String to NSDate.
var dateAsString = "24-12-2015 23:59"
dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
var newDate = dateFormatter.date(from: dateAsString)


dateAsString = "Thu, 08 Oct 2015 09:22:33 GMT"
dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
newDate = dateFormatter.date(from: dateAsString)


//
// NSDATE AND NSDATECOMPONENTS
//
// Converting NSDate to NSDateComponents.
let calendar = NSCalendar.current
let dateComponents = calendar.dateComponents([Calendar.Component.day,
                                              Calendar.Component.month,
                                              Calendar.Component.year,
                                              Calendar.Component.weekOfYear,
                                              Calendar.Component.hour,
                                              Calendar.Component.minute,
                                              Calendar.Component.second,
                                              Calendar.Component.nanosecond], from: currentDate)

print("day = \(String(describing: dateComponents.day))",
    "month = \(String(describing: dateComponents.month))",
    "year = \(String(describing: dateComponents.year))",
    "week of year = \(String(describing: dateComponents.weekOfYear))",
    "hour = \(String(describing: dateComponents.hour))",
    "minute = \(String(describing: dateComponents.minute))",
    "second = \(String(describing: dateComponents.second))",
    "nanosecond = \(String(describing: dateComponents.nanosecond))" ,
    separator: ", ",
    terminator: "")


// Converting NSDateComponents to NSDate.
var components = DateComponents()
components.day = 5
components.month = 01
components.year = 2016
components.hour = 19
components.minute = 30
//newDate = calendar.dateComponents(components)
newDate = calendar.date(from: components)


components.timeZone = NSTimeZone(abbreviation: "GMT") as TimeZone?
newDate = calendar.date(from: components)

components.timeZone = NSTimeZone(abbreviation: "CST") as TimeZone?
newDate = calendar.date(from: components)

components.timeZone = NSTimeZone(abbreviation: "CET") as TimeZone?
newDate = calendar.date(from: components)


//
// COMPARING DATES AND TIME.
//
dateFormatter.dateFormat = "MMM dd, yyyy zzz"
dateAsString = "Jan 08, 2015 GMT"
var date1 = dateFormatter.date(from: dateAsString)

dateAsString = "Jan 10, 2015 GMT"
var date2 = dateFormatter.date(from: dateAsString)


// Comparing dates - Method #1
date1! == date2!
date1! != date2!
date1! < date2!
date1! > date2!

if date1! < date2! {
    print("Earlier date is: \(String(describing: date1))")
}else{
    print("Later date is: \(String(describing: date2))")
}


// Comparing dates - Method #2
if date1!.compare(date2!) == ComparisonResult.orderedDescending {
    print("Date1 is Later than Date2")
}
else if date1!.compare(date2!) == ComparisonResult.orderedAscending {
    print("Date1 is Earlier than Date2")
}
else if date1!.compare(date2!) == ComparisonResult.orderedSame {
    print("Same dates")
}

// Comparing dates - Method #3
if date1!.timeIntervalSinceReferenceDate > date2!.timeIntervalSinceReferenceDate {
    print("Date1 is Later than Date2")
}
else if date1!.timeIntervalSinceReferenceDate <  date2!.timeIntervalSinceReferenceDate {
    print("Date1 is Earlier than Date2")
}
else {
    print("Same dates")
}

// Comparing time.
dateFormatter.dateFormat = "HH:mm:ss zzz"
dateAsString = "14:28:16 GMT"
date1 = dateFormatter.date(from: dateAsString)!

dateAsString = "19:53:12 GMT"
date2 = dateFormatter.date(from: dateAsString)!

date1! == date2!
date1! != date2!
date1! < date2!
date1! > date2!

if date1! < date2! {
    print("Earlier time is: \(String(describing: date1))")
}else{
    print("Later time is: \(String(describing: date2))")
}

//
// CALCULATING FUTURE AND PAST DATES
//
// Dates in the future.
let monthsToAdd = 2
let daysToAdd = 5

// Method #1
var calculatedDate = Calendar.current.date(byAdding: Calendar.Component.month, value: monthsToAdd, to: currentDate)
calculatedDate = Calendar.current.date(byAdding: Calendar.Component.day, value: daysToAdd, to: currentDate)


// Method #2
var newDateComponents = DateComponents()
newDateComponents.month = monthsToAdd
newDateComponents.day = daysToAdd

calculatedDate = Calendar.current.date(byAdding: newDateComponents, to: currentDate)

// Method #3
// Add 1.5 hours to the current time.
let hoursToAddInSeconds: TimeInterval = 90 * 60
calculatedDate = calculatedDate?.addingTimeInterval(hoursToAddInSeconds)


// Find a date in the past.
let numberOfDays = -5684718
calculatedDate = Calendar.current.date(byAdding: Calendar.Component.day, value: numberOfDays, to: currentDate)

dateFormatter.dateFormat = "EEEE, MMM dd, yyyy GGG"
dateAsString = dateFormatter.string(from: calculatedDate!)



//
// CALCULATING DATE DIFFERENCE
//
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
dateAsString = "2015-10-08 14:25:37"
date1 = dateFormatter.date(from: dateAsString)!

dateAsString = "2018-03-05 08:14:19"
date2 = dateFormatter.date(from: dateAsString)!


// Method #1
var diffDateComponents = Calendar.current.dateComponents([Calendar.Component.year,
                                                           Calendar.Component.month,
                                                           Calendar.Component.day,
                                                           Calendar.Component.hour,
                                                           Calendar.Component.minute,
                                                           Calendar.Component.second], from: date1!, to: date2!)

print("The difference between dates is: \(String(describing: diffDateComponents.year)) years, \(String(describing: diffDateComponents.month)) months, \(String(describing: diffDateComponents.day)) days, \(String(describing: diffDateComponents.hour)) hours, \(String(describing: diffDateComponents.minute)) minutes, \(String(describing: diffDateComponents.second)) seconds")

let dateComponentsFormatter = DateComponentsFormatter()
dateComponentsFormatter.unitsStyle = .full


// Method #2
let interval = date2?.timeIntervalSince(date1!)
dateComponentsFormatter.string(from: interval!)


// Method #3
dateComponentsFormatter.allowedUnits = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second]
let autoFormattedDifference = dateComponentsFormatter.string(from: date1!, to: date2!)
