//
//  AddAppointmentViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 21/11/22.
//

import SwiftUI
import EventKit

final class AddAppointmentViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    private let notificationManager = LocalNotificationManager.current
    private let eventStore = EKEventStore()
    
    @Published var isSuccessModalPresented: Bool = false
    @Published var isValidationModalPresented: Bool = false
    
    @Published var appointmentName: String = ""
    @Published var appointmentDate: Date = .now
    @Published var appointmentTime: Date = .now
    @Published var isAddedToCalendar: Bool = false
    
    /// Validating whether all of the data has been inputted by the user.
    /// - Returns: Returns `true` if all of the data has been inputted, `false` if some/all of the data hasn't been inputted.
    private func validateData() -> Bool {
        !appointmentName.isEmpty
    }
    
    /// Adding the appointment data to CoreData model
    /// - Parameter completionHandler: A block to execute task after the data has successfully inputted
    private func addAppointment(completionHandler: @escaping () -> Void = {}) {
        let appointment = AppointmentModel(appointmentId: UUID(),
                                           name: appointmentName,
                                           date: appointmentDate,
                                           time: appointmentTime,
                                           addToCalendar: isAddedToCalendar)
        repository.saveAppointment(appointment)
        completionHandler()
    }
    
    /// Saves the appointment event to the device's calendar
    private func saveEventToCalendar() {
        eventStore.requestAccess(to: .event) { [weak self] (granted, error) in
            guard let self = self, error == nil, granted else { return }
            
            let event = EKEvent(eventStore: self.eventStore)
            event.title = self.appointmentName
            event.startDate = self.appointmentDate
            event.endDate = self.appointmentDate
            event.isAllDay = true
            event.calendar = self.eventStore.defaultCalendarForNewEvents
            
            do {
                try self.eventStore.save(event, span: .thisEvent)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    /// Saving all of the inputted data to CoreData model. If the data hasn't completely inputted, it will show a modal asking the user ot complete all of the required data.
    func saveData() {
        if validateData() {
            addAppointment { [unowned self] in
                if self.isAddedToCalendar {
                    self.saveEventToCalendar()
                }
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
    
}
