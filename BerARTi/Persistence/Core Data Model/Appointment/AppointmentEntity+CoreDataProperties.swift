//
//  AppointmentEntity+CoreDataProperties.swift
//  BerARTi
//
//  Created by cleanmac-ada on 21/11/22.
//
//

import Foundation
import CoreData

extension AppointmentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AppointmentEntity> {
        return NSFetchRequest<AppointmentEntity>(entityName: "AppointmentEntity")
    }

    @NSManaged public var appointmentId: UUID
    @NSManaged public var name: String
    @NSManaged public var date: Date
    @NSManaged public var time: Date
    @NSManaged public var addToCalendar: Bool
    
    var asModel: AppointmentModel {
        get {
            return AppointmentModel(appointmentId: self.appointmentId,
                                    name: self.name,
                                    date: self.date,
                                    time: self.time,
                                    addToCalendar: self.addToCalendar)
        } set {
            self.appointmentId = newValue.appointmentId
            self.name = newValue.name
            self.date = newValue.date
            self.time = newValue.time
            self.addToCalendar = newValue.addToCalendar
        }
    }
    
}

extension AppointmentEntity : Identifiable {

}
