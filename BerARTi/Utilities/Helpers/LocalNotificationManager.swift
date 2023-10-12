//
//  LocalNotificationManager.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 27/10/22.
//

import Foundation
import NotificationCenter

//@MainActor
final class LocalNotificationManager: NSObject, ObservableObject {
    static let current = LocalNotificationManager()
    
    private let notificationCenter = UNUserNotificationCenter.current()
    @Published var isGranted = false
    @Published var pendingRequests: [UNNotificationRequest] = []
    
    private override init() {
        super.init()
        notificationCenter.delegate = self
    }
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [.sound, .badge, .alert])
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    func schedule(localNotification: LocalNotification) async {
        let content = UNMutableNotificationContent()
        content.title = localNotification.title
        content.body = localNotification.body
        if let subtitle = localNotification.subtitle {
            content.subtitle = subtitle
        }
        if let bundleImageName = localNotification.bundleImageName {
            if let url = Bundle.main.url(forResource: bundleImageName, withExtension: "") {
                if let attachment = try? UNNotificationAttachment(identifier: bundleImageName, url: url) {
                    content.attachments = [attachment]
                }
            }
        }
        content.sound = .default
        if localNotification.scheduleType == .time {
        guard let timeInterval = localNotification.timeInterval else { return }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval,
                                                        repeats: localNotification.repeats)
            let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
            try? await notificationCenter.add(request)
        } else {
            guard let dateComponents = localNotification.dateComponents else { return }
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: localNotification.repeats)
            let request = UNNotificationRequest(identifier: localNotification.identifier, content: content, trigger: trigger)
            try? await notificationCenter.add(request)
        }
        await getPendingRequests()
    }
    
    func scheduleBeforeMedicineReminder(reminderModel: ReminderModel) {
        let content = UNMutableNotificationContent()
        content.title = "Hai Orang Hebat"
        content.body = "Sebentar lagi diminum ya vitaminnya!"
        content.categoryIdentifier = "before_reminder"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = reminderModel.hour
        dateComponents.minute = reminderModel.minute - reminderModel.remindBefore
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let identifier = "\(reminderModel.reminderId.uuidString)_before_reminder"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request)
        
        var notificationIdentifiers = UserDefaults.standard.notificationIdentifiers
        notificationIdentifiers.append(identifier)
        UserDefaults.standard.notificationIdentifiers = notificationIdentifiers
    }
    
    func scheduleMedicineReminder(reminderModel: ReminderModel) {
        let content = UNMutableNotificationContent()
        content.title = "❤️"
        content.body = "Hai kamu, udah masuk jamnya nih 😉"
        content.categoryIdentifier = "reminder"
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = reminderModel.hour
        dateComponents.minute = reminderModel.minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let identifier = "\(reminderModel.reminderId.uuidString)_reminder"
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        notificationCenter.add(request)
        
        var notificationIdentifiers = UserDefaults.standard.notificationIdentifiers
        notificationIdentifiers.append(identifier)
        UserDefaults.standard.notificationIdentifiers = notificationIdentifiers
    }
    
    func getPendingRequests() async {
        pendingRequests = await notificationCenter.pendingNotificationRequests()
        print("Pending: \(pendingRequests.count)")
    }
    
    func removeRequest(withIdentifier identifier: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        if let index = pendingRequests.firstIndex(where: {$0.identifier == identifier}) {
            pendingRequests.remove(at: index)
            print("Pending: \(pendingRequests.count)")
        }
    }
    
    func clearRequests() {
        notificationCenter.removeAllPendingNotificationRequests()
        pendingRequests.removeAll()
        print("Pending: \(pendingRequests.count)")
    }
}

extension LocalNotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        await getPendingRequests()
        return [.sound, .banner]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // FIXME: Handle Notification tap handler here
        completionHandler()
    }
}
