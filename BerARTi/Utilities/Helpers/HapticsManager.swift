//
//  HapticsManager.swift
//  BerARTi
//
//  Created by cleanmac-ada on 21/11/22.
//

import Foundation
import UIKit
import CoreHaptics

final class HapticsManager {
    private let generator = UINotificationFeedbackGenerator()
    
    static let shared = HapticsManager()
    
    private init() {}
    
    func notifySuccess() {
        generator.notificationOccurred(.success)
    }
    
    func notifyError() {
        generator.notificationOccurred(.error)
    }
    
    func notifyWarning() {
        generator.notificationOccurred(.warning)
    }
    
}
