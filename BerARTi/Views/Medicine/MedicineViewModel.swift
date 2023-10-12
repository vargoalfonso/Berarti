//
//  MedicineViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 26/11/22.
//

import Foundation
import Combine

final class MedicineViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    @Published var reminderList: [ReminderModel] = []
    
    let daysOfTheCurrentWeek = Date.getDatesFromCurrentWeek()
    
    /// Getting all of the data contained in CoreData model
    func getAllData() {
        reminderList = repository.getAllReminders()
    }
    
    /// Getting the reminder progress of a certain date
    /// - Parameter index: The day index
    /// - Returns: Returns a Double value for calculating the progress
    func getProgressFromDate(index: Int) -> Double {
        repository.getReminderProgress(from: daysOfTheCurrentWeek[index])
    }
}
