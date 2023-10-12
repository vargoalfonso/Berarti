//
//  ReminderEntity+CoreDataProperties.swift
//  BerARTi
//
//  Created by cleanmac-ada on 10/11/22.
//
//

import Foundation
import CoreData

extension ReminderEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ReminderEntity> {
        return NSFetchRequest<ReminderEntity>(entityName: "ReminderEntity")
    }

    @NSManaged public var reminderId: UUID
    @NSManaged public var medicineId: UUID
    @NSManaged public var arvId: Int32
    @NSManaged public var remindbefore: Int32
    @NSManaged public var hour: Int32
    @NSManaged public var minute: Int32

    var asModel: ReminderModel {
        get {
            return ReminderModel(reminderId: self.reminderId,
                                 medicineId: self.medicineId,
                                 arvId: Int(self.arvId),
                                 hour: Int(self.hour),
                                 minute: Int(self.minute),
                                 remindBefore: Int(self.remindbefore))
        } set {
            self.reminderId = newValue.reminderId
            self.medicineId = newValue.medicineId
            self.arvId = Int32(newValue.arvId)
            self.hour = Int32(newValue.hour)
            self.minute = Int32(newValue.minute)
            self.remindbefore = Int32(newValue.remindBefore)
        }
    }
}

extension ReminderEntity : Identifiable {

}
