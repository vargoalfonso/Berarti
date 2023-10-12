//
//  BloodResultEntity+CoreDataProperties.swift
//  BerARTi
//
//  Created by cleanmac-ada on 15/11/22.
//
//

import Foundation
import CoreData

extension BloodResultEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BloodResultEntity> {
        return NSFetchRequest<BloodResultEntity>(entityName: "BloodResultEntity")
    }

    @NSManaged public var bloodResultId: UUID
    @NSManaged public var testDate: Date
    @NSManaged public var testTime: Date
    @NSManaged public var cd4Amount: Int32
    @NSManaged public var viralLoadAmount: Int32

    var asModel: BloodResultModel {
        get {
            return BloodResultModel(bloodResultId: self.bloodResultId,
                                    testDate: self.testDate,
                                    testTime: self.testTime,
                                    cd4Amount: Int(self.cd4Amount),
                                    viralLoadAmount: Int(self.viralLoadAmount))
        } set {
            self.bloodResultId = newValue.bloodResultId
            self.testDate = newValue.testDate
            self.testTime = newValue.testTime
            self.cd4Amount = Int32(self.cd4Amount)
            self.viralLoadAmount = Int32(self.viralLoadAmount)
        }
    }
}

extension BloodResultEntity : Identifiable {

}
