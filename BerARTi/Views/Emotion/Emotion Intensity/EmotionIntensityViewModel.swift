//
//  EmotionIntensityViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import Foundation
import Combine

final class EmotionIntensityViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    let selectedEmotion: Emotion
    var intensity: Int = 0
    @Published var story: String = ""
    
    init(selectedEmotion: Emotion) {
        self.selectedEmotion = selectedEmotion
    }
    
    /// Saving all of the inputted data to CoreData model.
    func saveData() {
        let model = EmotionModel(emotionId: UUID(),
                                 emotionTypeId: selectedEmotion.rawValue,
                                 intensity: intensity,
                                 story: story,
                                 timestamp: Date())
        repository.saveEmotion(model)
    }
}
