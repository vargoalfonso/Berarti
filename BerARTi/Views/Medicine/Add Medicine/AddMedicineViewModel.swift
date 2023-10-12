//
//  AddMedicineViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 11/11/22.
//

import Foundation
import SwiftUI

final class AddMedicineViewModel: ObservableObject {
    private var medicineModel: MedicineModel!
    
    private let repository = CoreDataRepository.current
    private let notificationManager = LocalNotificationManager.current
    
    @Published var isTimePickerModalPresented: Bool = false
    @Published var isSuccessModalPresented: Bool = false
    @Published var isValidationModalPresented: Bool = false
    @Published var isCancelModalPresented: Bool = false
    
    private(set) var frequencyModalTag: Int = 1
    
    @Published var type: MedicineType = .unit
    @Published var arvModel: ARVModel? = nil
    @Published var frequency: MedicineFrequency = .oneTime
    @Published var remindBefore: Int? = nil

    @Published var reminderTimes: [(Int, Int)?] = [nil, nil, nil]
    
    let frequencies: [MedicineFrequency] = [.oneTime, .twoTimes, .threeTimes]
    let remindBefores: [Int] = [5, 10, 15, 30]
    
    /// Adding the medicine data to CoreData model
    /// - Parameter completionHandler: A block to execute task after the data has successfully inputted
    private func addMedicine(completionHandler: @escaping () -> Void = {}) {
        medicineModel = MedicineModel(
            id: UUID(),
            type: type,
            arvId: arvModel!.id,
            frequency: frequency.rawValue,
            remindBefore: remindBefore!)
        
        repository.saveMedicine(medicineModel)
        completionHandler()
    }
    
    /// Adding the reminders data to CoreData model
    /// - Parameter completionHandler: A block to execute task after the data has successfully inputted
    private func addReminder(completionHandler: @escaping () -> Void = {}) {
        for index in 0...(frequency.rawValue-1) {
            let reminder = ReminderModel(reminderId: UUID(), medicineId: medicineModel.id, arvId: arvModel!.id, hour: reminderTimes[index]!.0, minute: reminderTimes[index]!.1, remindBefore: remindBefore!)
            repository.saveReminder(reminder) { [weak self] in
                self?.notificationManager.scheduleBeforeMedicineReminder(reminderModel: reminder)
                self?.notificationManager.scheduleMedicineReminder(reminderModel: reminder)
            }
        }
        completionHandler()
    }
    
    /// Validating whether the reminder times already inputted based on how many times user wants to be reminded
    /// - Returns: Returns `true` if  all the required time has been inputted, `false` if some/all of the data hasn't been inputted.
    private func validateReminderTimes() -> Bool {
        switch frequency {
        case .oneTime:
            return (reminderTimes[0] != nil)
        case .twoTimes:
            return (reminderTimes[0] != nil) && (reminderTimes[1] != nil)
        case .threeTimes:
            return (reminderTimes[0] != nil) && (reminderTimes[1] != nil) && (reminderTimes[2] != nil)
        }
    }
    
    /// Validating whether all of the data has been inputted by the user.
    /// - Returns: Returns `true` if all of the data has been inputted, `false` if some/all of the data hasn't been inputted.
    private func validateData() -> Bool {
        (arvModel != nil) && (remindBefore != nil) && (!reminderTimes.isEmpty) && validateReminderTimes()
    }
    
    /// Saving all of the inputted data to CoreData model. If the data hasn't completely inputted, it will show a modal asking the user ot complete all of the required data.
    func saveData() {
        if validateData() {
            let dispatchGroup = DispatchGroup()

            dispatchGroup.enter()
            addMedicine {
                dispatchGroup.leave()
            }

            dispatchGroup.enter()
            addReminder {
                dispatchGroup.leave()
            }

            dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
                guard let self = self else { return }
                withAnimation {
                    self.isSuccessModalPresented = true
                }
            }
        } else {
            withAnimation {
                isValidationModalPresented = true
            }
        }
    }
    
    /// Returns the selected string placeholder for the inputted reminder time field
    /// - Parameter tag: An integer value to differentiate which field is being inputted
    /// - Returns: Returns a `String` for the field's placeholder
    func getSelectedStringForReminderTimeSelector(tag: Int) -> String? {
        var selectedString: String? = nil
        if reminderTimes[tag-1] != nil {
            selectedString = "\(String(format: "%02d", reminderTimes[tag-1]!.0)):\(String(format: "%02d", reminderTimes[tag-1]!.1))"
        }
        return selectedString
    }
    
    /// Shows a time picker modal based on which field was tapped
    /// - Parameter tag: An integer to indicate which field was about to be inputted
    /// - Returns: Returns the tag from the field tapped by the user
    @discardableResult func showReminderTimePickerModal(tag: Int) -> Int {
        frequencyModalTag = tag
        withAnimation {
            isTimePickerModalPresented = true
        }
        return frequencyModalTag
    }
}
