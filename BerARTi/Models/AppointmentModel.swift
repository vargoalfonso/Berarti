//
//  AppointmentModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 21/11/22.
//
 
import CoreData

struct AppointmentModel {
    var appointmentId: UUID
    var name: String
    var date: Date
    var time: Date
    var addToCalendar: Bool
}

extension AppointmentModel {
    func asEntity(with context: NSManagedObjectContext) -> AppointmentEntity {
        let entity = AppointmentEntity(context: context)
        entity.setValue(appointmentId, forKey: #keyPath(AppointmentEntity.appointmentId))
        entity.setValue(name, forKey: #keyPath(AppointmentEntity.name))
        entity.setValue(date, forKey: #keyPath(AppointmentEntity.date))
        entity.setValue(time, forKey: #keyPath(AppointmentEntity.time))
        entity.setValue(addToCalendar, forKey: #keyPath(AppointmentEntity.addToCalendar))
        return entity
    }
}
