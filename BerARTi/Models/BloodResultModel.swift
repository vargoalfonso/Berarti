//
//  BloodResultModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 15/11/22.
//

import CoreData

struct BloodResultModel {
    var bloodResultId: UUID
    var testDate: Date
    var testTime: Date
    var cd4Amount: Int
    var viralLoadAmount: Int
    
    var stage: BloodResultStage {
        if viralLoadAmount <= 100 {
            return .undetected
        } else if 100 < viralLoadAmount && viralLoadAmount <= 2000 {
            return .lowrisk
        } else if 2000 < viralLoadAmount && viralLoadAmount <= 6000 {
            return .medrisk
        } else {
            return .highrisk
        }
    }
}

extension BloodResultModel {
    func asEntity(with context: NSManagedObjectContext) -> BloodResultEntity {
        let entity = BloodResultEntity(context: context)
        entity.setValue(bloodResultId, forKey: #keyPath(BloodResultEntity.bloodResultId))
        entity.setValue(testDate, forKey: #keyPath(BloodResultEntity.testDate))
        entity.setValue(testTime, forKey: #keyPath(BloodResultEntity.testTime))
        entity.setValue(Int32(cd4Amount), forKey: #keyPath(BloodResultEntity.cd4Amount))
        entity.setValue(Int32(viralLoadAmount), forKey: #keyPath(BloodResultEntity.viralLoadAmount))
        return entity
    }
}
