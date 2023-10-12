//
//  ChangeNotificationMessageViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 21/11/22.
//

import Foundation
import Combine

final class ChangeNotificationMessageViewModel: ObservableObject {
    @Published var notificationText: String = ""
    
    init() {
        notificationText = UserDefaults.standard.notificationMessage
    }
    
    /// Saves the inputted message
    /// - Parameter completionHandler: Execute something after the user saves the message
    func saveMessage(completionHandler: @escaping () -> Void = {}) {
        UserDefaults.standard.notificationMessage = notificationText
        completionHandler()
    }
}
