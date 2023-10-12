//
//  EmotionHistoryViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import Foundation
import Combine

final class EmotionHistoryViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    @Published var currentEmotions: [EmotionModel] = []
    @Published var selectedDate: Date
    
    let daysOfTheCurrentWeek = Date.getDatesFromCurrentWeek()
    
    init() {
        self.selectedDate = daysOfTheCurrentWeek.first(where: { $0.toString(format: "dd/MM/yyyy") == Date.now.toString(format: "dd/MM/yyyy") })!
        fetchEmotions()
    }
    
    /// Retrieving all of the emotions on a specific date
    /// - Parameter date: The date of the emotions
    func fetchEmotions() {
        currentEmotions = repository.getAllEmotions(selectedDate).reversed()
    }
    
}
