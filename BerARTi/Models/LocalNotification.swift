//
//  LocalNotification.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 27/10/22.
//

import Foundation

struct LocalNotification {
    var identifier: String
    var scheduleType: ScheduleType
    var title: String
    var body: String
    var subtitle: String?
    var bundleImageName: String?
    var timeInterval: Double?
    var dateComponents: DateComponents?
    var repeats: Bool
    
    enum ScheduleType {
        case time, calendar
    }
    
    init(identifier: String, title: String,body: String, dateComponents: DateComponents, repeats: Bool) {
        self.identifier = identifier
        self.scheduleType = .calendar
        self.title = title
        self.body = body
        self.timeInterval = nil
        self.dateComponents = dateComponents
        self.repeats = repeats
    }
}
