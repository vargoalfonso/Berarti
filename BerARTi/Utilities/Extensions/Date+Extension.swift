//
//  Date+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 15/11/22.
//

import Foundation

extension Date {
    /// The starting date of today
    static var startingDay: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: .now)
        components.hour = 00
        components.minute = 00
        components.second = 00
        return calendar.date(from: components)!
    }
    
    /// The ending date of today
    static var endingDay: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: .now)
        components.hour = 23
        components.minute = 59
        components.second = 59
        return calendar.date(from: components)!
    }
    
    /// Get a string representation of the date
    /// - Parameter format: The date format
    /// - Returns: The string representation of the formatted date
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    // Source: https://stackoverflow.com/questions/38641982/converting-date-between-timezones-swift
    /// Convert a `Date` to a specific `TimeZone`
    /// - Parameters:
    ///   - outputTimeZone: The specific Time Zone for converting the Date
    ///   - inputTimeZone: The origin Time Zone
    /// - Returns: Returns a converted Date with a new Time Zone
    func toTimeZone(timeZone outputTimeZone: TimeZone, from inputTimeZone: TimeZone = .current) -> Date {
        let delta = TimeInterval(outputTimeZone.secondsFromGMT(for: self) - inputTimeZone.secondsFromGMT(for: self))
        return addingTimeInterval(delta)
    }
    
    // Source: https://stackoverflow.com/questions/42981665/how-to-get-all-days-in-current-week-in-swift
    /// Get all of dates of the current week
    /// - Returns: An array of `Date` objects of the current week
    static func getDatesFromCurrentWeek() -> [Date] {
        var dates: [Date] = []
        let calendar = Calendar.current
        guard let dateInterval = calendar.dateInterval(of: .weekOfYear, for: Date()) else {
            return dates
        }
        
        calendar.enumerateDates(startingAfter: dateInterval.start,
                                matching: DateComponents(hour: 0),
                                matchingPolicy: .nextTime)
        { date, _, stop in
            guard let date else {
                return
            }
            if date <= dateInterval.end {
                let convertedDate = date.toTimeZone(timeZone: TimeZone(abbreviation: "UTC")!)
                dates.append(convertedDate)
            } else {
                stop = true
            }
        }
        
        return dates
    }
    
}
