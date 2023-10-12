//
//  CoreDataRepository.swift
//  BerARTi
//
//  Created by cleanmac-ada on 09/11/22.
//

import Foundation
import CoreData

final class CoreDataRepository {
    static let current = CoreDataRepository()
    
    private let stack: CoreDataStack
    let managedContext: NSManagedObjectContext
    
    private init() {
        stack = CoreDataStack()
        managedContext = stack.managedContext
    }
    
    // MARK: - Medicine
    
    /// Getting all the Medicine objects in CoreData model
    /// - Returns: An array of Medicine entity converted to Swift Struct
    func getAllMedicines() -> [MedicineModel] {
        let fetchRequest: NSFetchRequest<MedicineEntity> = MedicineEntity.fetchRequest()
        var requestResult = [MedicineModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Adding a new Medicine object to CoreData model
    /// - Parameter medicine: A Medicine object to save
    func saveMedicine(_ medicine: MedicineModel) {
        let entitiy = medicine.asEntity(with: managedContext)
        stack.saveContext()
    }
    
    // MARK: - Reminder
    
    /// Getting all the Reminder objects in CoreData model
    /// - Returns: An array of Reminder entity converted to Swift Struct
    func getAllReminders() -> [ReminderModel] {
        let fetchRequest: NSFetchRequest<ReminderEntity> = ReminderEntity.fetchRequest()
        var requestResult = [ReminderModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Getting all the reminders based on the related medicine
    /// - Parameter medicineId: The ID of the medicine
    /// - Returns: Returns the reminder model of a certain medicine
    func getReminderFromMedicine(_ medicineId: UUID) -> ReminderModel? {
        let fetchRequest: NSFetchRequest<ReminderEntity> = ReminderEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "medicineId == %@", medicineId as NSUUID)
        
        var result: ReminderModel? = nil
        
        do {
            result = try managedContext.fetch(fetchRequest).first?.asModel
        } catch {
            print(error.localizedDescription)
        }
        
        return result
    }
    
    /// Adding a new Reminder object to CoreData model
    /// - Parameter reminder: A Reminder object to save
    func saveReminder(_ reminder: ReminderModel, completionHandler: @escaping () -> Void = {})  {
        let entity = reminder.asEntity(with: managedContext)
        stack.saveContext()
        completionHandler()
    }
    
    // MARK: - Blood Result
    
    /// Getting all the Blood Result objects in CoreData model
    /// - Returns: An array of Blood Result entity converted to Swift Struct
    func getAllBloodResults() -> [BloodResultModel] {
        let fetchRequest: NSFetchRequest<BloodResultEntity> = BloodResultEntity.fetchRequest()
        var requestResult = [BloodResultModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Adding a new Blood Result object to CoreData model
    /// - Parameter bloodResult: A Blood Result object to save
    func saveBloodResult(_ bloodResult: BloodResultModel) {
        let entity = bloodResult.asEntity(with: managedContext)
        stack.saveContext()
    }
    
    // MARK: - Appointment
    
    /// Getting all the Appointment objects in CoreData model
    /// - Returns: An array of Appointment entity converted to Swift Struct
    func getAllAppointments() -> [AppointmentModel] {
        let fetchRequest: NSFetchRequest<AppointmentEntity> = AppointmentEntity.fetchRequest()
        var requestResult = [AppointmentModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Getting all the active Appointment objects in CoreData model
    /// - Returns: An array of Appointment entity converted to Swift Struct
    func getActiveAppointments() -> [AppointmentModel] {
        let fetchRequest: NSFetchRequest<AppointmentEntity> = AppointmentEntity.fetchRequest()
        var requestResult = [AppointmentModel]()
        
        let startDate = Date.now
        fetchRequest.predicate = NSPredicate(format: "date >= %@", startDate as NSDate)
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Getting all the upcoming Appointment objects in CoreData model
    /// - Returns: An array of Appointment entity converted to Swift Struct
    func getUpcomingAppointments() -> [AppointmentModel] {
        let fetchRequest: NSFetchRequest<AppointmentEntity> = AppointmentEntity.fetchRequest()
        var requestResult = [AppointmentModel]()
        
        let today = Date.now
        let calendar = Calendar.current
        let midnight = calendar.startOfDay(for: today)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: midnight)!
        
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date <= %@", today as NSDate, tomorrow as NSDate)
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Adding a new Appointment object to CoreData model
    /// - Parameter appointment: A Appointment object to save
    func saveAppointment(_ appointment: AppointmentModel) {
        let entity = appointment.asEntity(with: managedContext)
        stack.saveContext()
    }
    
    // MARK: - Emotion
    
    /// Getting all the Emotion objects in CoreData model
    /// - Returns: An array of Emotion entity converted to Swift Struct
    func getAllEmotions() -> [EmotionModel] {
        let fetchRequest: NSFetchRequest<EmotionEntity> = EmotionEntity.fetchRequest()
        var requestResult = [EmotionModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Get all the Emotion objects based on the inputted Date
    /// - Parameter date: The date of the emotions
    /// - Returns: An array of Emotion entity converted to Swift Struct
    func getAllEmotions(_ date: Date) -> [EmotionModel] {
        let fetchRequest: NSFetchRequest<EmotionEntity> = EmotionEntity.fetchRequest()
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar.date(from: components)
        
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.date(from: components)
        
        fetchRequest.predicate = NSPredicate(format: "timestamp >= %@ AND timestamp =< %@", startDate! as NSDate, endDate! as NSDate)
        
        var requestResult = [EmotionModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Adding a new Emotion object to CoreData model
    /// - Parameter emotion: A Emotion object to save
    func saveEmotion(_ emotion: EmotionModel) {
        let entity = emotion.asEntity(with: managedContext)
        stack.saveContext()
    }
    
    // MARK: - Reminder History
    
    /// Finish reminder based on ID
    /// - Parameter reminderId: The ID of the reminder to finish
    func finishReminder(reminderId: UUID) {
        let entity = ReminderHistoryModel(reminderHistoryId: UUID(),
                                          reminderId: reminderId,
                                          timestamp: Date.now)
            .asEntity(with: managedContext)
        stack.saveContext()
    }
    
    /// Check whether a certain Reminder has been finished for today
    /// - Parameter reminderId: The Id of the Reminder
    /// - Returns: Returns a boolean to indicate the finished state
    @discardableResult func checkIfReminderIsFinished(reminderId: UUID) -> Bool {
        let fetchRequest: NSFetchRequest<ReminderHistoryEntity> = ReminderHistoryEntity.fetchRequest()
        var reminderHistory: ReminderHistoryModel?
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date.now)
        
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar.date(from: components)
        
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.date(from: components)
        
        fetchRequest.predicate = NSPredicate(format: "timestamp >= %@ AND timestamp =< %@ AND reminderId == %@",
                                             startDate! as NSDate,
                                             endDate! as NSDate,
                                             reminderId as NSUUID)
        
        do {
            reminderHistory = try managedContext.fetch(fetchRequest).first?.asModel
        } catch {
            print(error.localizedDescription)
        }
        
        return reminderHistory != nil
    }
    
    /// Get todays reminder history
    /// - Returns: Returns all of reminder for today
    func getReminderHistory(from date: Date = .now) -> [ReminderHistoryModel] {
        let fetchRequest: NSFetchRequest<ReminderHistoryEntity> = ReminderHistoryEntity.fetchRequest()
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        components.hour = 00
        components.minute = 00
        components.second = 00
        let startDate = calendar.date(from: components)
        
        components.hour = 23
        components.minute = 59
        components.second = 59
        let endDate = calendar.date(from: components)
        
        fetchRequest.predicate = NSPredicate(format: "timestamp >= %@ AND timestamp =< %@", startDate! as NSDate, endDate! as NSDate)
        
        var requestResult = [ReminderHistoryModel]()
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            if !results.isEmpty {
                for result in results {
                    requestResult.append(result.asModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return requestResult
    }
    
    /// Getting the progression of todays reminder
    /// - Returns: Returns a Double value for calculating the progress
    func getReminderProgress(from date: Date = .now) -> Double {
        let allProgressCount = getAllReminders().count
        let completedProgressCount = getReminderHistory(from: date).count
        
        return completedProgressCount != 0 ? Double(completedProgressCount / allProgressCount) : 0
    }
}
