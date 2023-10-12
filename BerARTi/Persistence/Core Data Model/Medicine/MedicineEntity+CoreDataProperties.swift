//
//  MedicineEntity+CoreDataProperties.swift
//  BerARTi
//
//  Created by cleanmac-ada on 10/11/22.
//
//

import Foundation
import CoreData

extension MedicineEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MedicineEntity> {
        return NSFetchRequest<MedicineEntity>(entityName: "MedicineEntity")
    }

    @NSManaged public var medicineId: UUID?
    @NSManaged public var type: Int32
    @NSManaged public var arvId: Int32
    @NSManaged public var frequency: Int32
    @NSManaged public var remindbefore: Int32

    var asModel: MedicineModel {
        get {
            return MedicineModel(id: self.medicineId!,
                                 type: MedicineType(rawValue: Int(type))!,
                                 arvId: Int(self.arvId),
                                 frequency: Int(self.frequency),
                                 remindBefore: Int(self.remindbefore))
        } set {
            self.medicineId = newValue.id
            self.type = Int32(newValue.type.rawValue)
            self.arvId = Int32(newValue.arvId)
            self.frequency = Int32(newValue.frequency)
            self.remindbefore = Int32(newValue.remindBefore)
        }
    }
    
}

extension MedicineEntity : Identifiable {

}
