//
//  EmotionEntity+CoreDataProperties.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//
//

import Foundation
import CoreData

extension EmotionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmotionEntity> {
        return NSFetchRequest<EmotionEntity>(entityName: "EmotionEntity")
    }

    @NSManaged public var emotionId: UUID
    @NSManaged public var emotionTypeId: Int32
    @NSManaged public var story: String
    @NSManaged public var timestamp: Date
    @NSManaged public var intensity: Int32

    var asModel: EmotionModel {
        get {
            return EmotionModel(emotionId: self.emotionId,
                                emotionTypeId: Int(self.emotionTypeId),
                                intensity: Int(self.intensity),
                                story: self.story,
                                timestamp: self.timestamp)
        } set {
            self.emotionId = newValue.emotionId
            self.emotionTypeId = Int32(newValue.emotionTypeId)
            self.intensity = Int32(newValue.intensity)
            self.story = newValue.story
            self.timestamp = newValue.timestamp
        }
    }
}

extension EmotionEntity : Identifiable {

}
