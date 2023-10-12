//
//  AppointmentViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 13/11/22.
//

import Foundation
import Combine

final class AppointmentViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    @Published var showAddDataDropdown: Bool = false
    
    @Published var reminderList: [ReminderModel] = []
    @Published var appointmentList: [AppointmentModel] = []
    
    /// Getting all of the data contained in CoreData model
    func getAllData() {
        reminderList = repository.getAllReminders()
        appointmentList = repository.getActiveAppointments()
    }
}
