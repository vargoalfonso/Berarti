//
//  EmotionModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import Foundation
import CoreData

struct EmotionModel {
    var emotionId: UUID
    var emotionTypeId: Int
    var intensity: Int
    var story: String
    var timestamp: Date
    
    var emotion: Emotion {
        Emotion(rawValue: emotionTypeId) ?? .normal
    }
}

extension EmotionModel {
    func asEntity(with context: NSManagedObjectContext) -> EmotionEntity {
        let entity = EmotionEntity(context: context)
        entity.setValue(emotionId, forKey: #keyPath(EmotionEntity.emotionId))
        entity.setValue(Int32(emotionTypeId), forKey: #keyPath(EmotionEntity.emotionTypeId))
        entity.setValue(Int32(intensity), forKey: #keyPath(EmotionEntity.intensity))
        entity.setValue(story, forKey: #keyPath(EmotionEntity.story))
        entity.setValue(timestamp, forKey: #keyPath(EmotionEntity.timestamp))
        return entity
    }
}
