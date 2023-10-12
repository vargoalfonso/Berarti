//
//  MedicineModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 10/11/22.
//

import CoreData

struct MedicineModel {
    var id: UUID
    var type: MedicineType
    var arvId: Int
    var frequency: Int
    var remindBefore: Int
    
    var arvModel: ARVModel {
        let idToString = String(arvId)
        if idToString.first! == "1" {
            return ARVModel.getUnitAll().first(where: { $0.id == arvId })!
        } else {
            return ARVModel.getCombinationAll().first(where: { $0.id == arvId })!
        }
    }
}

extension MedicineModel {
    func asEntity(with context: NSManagedObjectContext) -> MedicineEntity {
        let entity = MedicineEntity(context: context)
        entity.setValue(id, forKey: #keyPath(MedicineEntity.medicineId))
        entity.setValue(Int32(type.rawValue), forKey: #keyPath(MedicineEntity.type))
        entity.setValue(Int32(arvId), forKey: #keyPath(MedicineEntity.arvId))
        entity.setValue(Int32(frequency), forKey: #keyPath(MedicineEntity.frequency))
        entity.setValue(Int32(remindBefore), forKey: #keyPath(MedicineEntity.remindbefore))
        return entity
    }
}
