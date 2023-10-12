//
//  ReminderHistoryEntity+CoreDataProperties.swift
//  BerARTi
//
//  Created by cleanmac-ada on 28/11/22.
//
//

import Foundation
import CoreData

extension ReminderHistoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderHistoryEntity> {
        return NSFetchRequest<ReminderHistoryEntity>(entityName: "ReminderHistoryEntity")
    }

    @NSManaged public var reminderHistoryId: UUID
    @NSManaged public var reminderId: UUID
    @NSManaged public var timestamp: Date
    
    var asModel: ReminderHistoryModel {
        get {
            return ReminderHistoryModel(reminderHistoryId: self.reminderHistoryId,
                                        reminderId: self.reminderId,
                                        timestamp: self.timestamp)
        } set {
            self.reminderHistoryId = newValue.reminderHistoryId
            self.reminderId = newValue.reminderId
            self.timestamp = newValue.timestamp
        }
    }
    
}

extension ReminderHistoryEntity : Identifiable {

}
