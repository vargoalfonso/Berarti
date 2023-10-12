//
//  ReminderModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 10/11/22.
//

import CoreData

struct ReminderModel {
    var reminderId: UUID
    var medicineId: UUID
    var arvId: Int
    var hour: Int
    var minute: Int
    var remindBefore: Int
    
    var arvModel: ARVModel {
        if String(arvId).first == "1" {
            return ARVModel.getUnitAll().first(where: { $0.id == arvId })!
        } else {
            return ARVModel.getCombinationAll().first(where: { $0.id == arvId })!
        }
    }
    
    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.date(from: "2022/11/11 \(String(format: "%02d", hour)):\(String(format: "%02d", minute))")!
    }
}

extension ReminderModel {
    func asEntity(with context: NSManagedObjectContext) -> ReminderEntity {
        let entity = ReminderEntity(context: context)
        entity.setValue(reminderId, forKey: #keyPath(ReminderEntity.reminderId))
        entity.setValue(medicineId, forKey: #keyPath(ReminderEntity.medicineId))
        entity.setValue(Int32(arvId), forKey: #keyPath(ReminderEntity.arvId))
        entity.setValue(Int32(hour), forKey: #keyPath(ReminderEntity.hour))
        entity.setValue(Int32(minute), forKey: #keyPath(ReminderEntity.minute))
        entity.setValue(Int32(remindBefore), forKey: #keyPath(ReminderEntity.remindbefore))
        return entity
    }
}

struct ReminderHistoryModel {
    var reminderHistoryId: UUID
    var reminderId: UUID
    var timestamp: Date
}

extension ReminderHistoryModel {
    func asEntity(with context: NSManagedObjectContext) -> ReminderHistoryEntity {
        let entity = ReminderHistoryEntity(context: context)
        entity.setValue(reminderHistoryId, forKey: #keyPath(ReminderHistoryEntity.reminderHistoryId))
        entity.setValue(reminderId, forKey: #keyPath(ReminderHistoryEntity.reminderId))
        entity.setValue(timestamp, forKey: #keyPath(ReminderHistoryEntity.timestamp))
        return entity
    }
}
