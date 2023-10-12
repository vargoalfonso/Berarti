//
//  DashboardViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 13/11/22.
//

import Foundation
import Combine
import SwiftUI

final class DashboardViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    @AppStorage(kUsername) var username: String = ""
    
    @Published var isShowingMedicineReminder: Bool = false
    @Published var isPresentingOnboarding: Bool = false
    @Published var isPresentingEmotionModal: Bool = false
    @Published var isPresentingReminderFinishedModal: Bool = false
    
    @Published var reminderList: [ReminderModel] = []
    @Published var upcomingAppointments: [AppointmentModel] = []
    @Published var latestBloodResult: BloodResultModel?
    @Published var latestEmotion: EmotionModel? = nil
    @Published var funFactList: [FunFact] = []
    
    private var selectedReminderToFinish: ReminderModel?
    private(set) var randomQuote: Quote!
    private var bindings = Set<AnyCancellable>()
    
    init() {
        retrieveRandomQuote()
        retrieveFunFacts()
        checkIfOnboardingNeeded()
        
        $isPresentingEmotionModal
            //.receive(on: RunLoop.main)
            .sink { [unowned self] value in
                if !value {
                    self.getLatestEmotion()
                }
            }.store(in: &bindings)
    }
    
    /// Retrieving all of the quotes objects from JSON data
    private func retrieveRandomQuote() {
        do {
            if let path = Bundle.main.path(forResource: "quotes", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                randomQuote = quotes.randomElement()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// Retrieving all of the fun facts objects from JSON data
    private func retrieveFunFacts() {
        do {
            if let path = Bundle.main.path(forResource: "funfacts", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                funFactList = try JSONDecoder().decode([FunFact].self, from: data)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// Check whether the app is first opened
    func checkIfOnboardingNeeded() {
        if !UserDefaults.standard.isPresentingOnboarding {
            isPresentingOnboarding = true
        }
        getLatestEmotion()
    }
    
    /// Getting the latest Blood Result data
    func getlatestBloodResult() {
        latestBloodResult = repository.getAllBloodResults().last
    }
    
    /// Getting all of the upcoming appointments
    func getUpcomingAppointments() {
        upcomingAppointments = repository.getUpcomingAppointments()
    }
    
    /// Getting all of the reminder data
    func getAllReminders() {
        reminderList = repository.getAllReminders()
    }
    
    /// Getting the latest emotion inputted by the user
    /// - Returns: The latest emotion model. If the user hasn't inputted today, then it returns nil.
    @discardableResult func getLatestEmotion() -> EmotionModel? {
        if let emotion = repository.getAllEmotions(.now).last {
            latestEmotion = emotion
        } else {
            isPresentingEmotionModal = true
        }
        return latestEmotion
    }
    
    /// Check whether the reminder is finished
    /// - Parameter reminderId: The Id of the reminder
    /// - Returns: Returns the finished state
    func isReminderFinished(reminderId: UUID) -> Bool {
        repository.checkIfReminderIsFinished(reminderId: reminderId)
    }
    
    /// Presenting a modal that asks the user whether they want to finish a reminder or not
    /// - Parameter model: The selected reminder to finish
    func willFinishReminder(_ model: ReminderModel) {
        selectedReminderToFinish = model
        withAnimation {
            isPresentingReminderFinishedModal = true
        }
    }
    
    /// Finish a certain reminder
    /// - Parameter reminderId: The Id of the reminder
    func finishReminder() {
        repository.finishReminder(reminderId: selectedReminderToFinish!.reminderId)
        selectedReminderToFinish = nil
        getAllReminders()
        withAnimation {
            isPresentingReminderFinishedModal = false
        }
    }

}
