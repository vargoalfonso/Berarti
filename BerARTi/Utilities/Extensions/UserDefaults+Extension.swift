//
//  UserDefaults+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 17/11/22.
//

import Foundation

let kBiometricAuthenticationEnabled = "biometricAuthenticationEnabled"
let kCriticalNotificationEnabled = "criticalNotificationEnabled"
let kIsPresentingOnboarding = "isPresentingOnboarding"
let kNotificationMessage = "notificationMessage"
let kNotificationIdentifiers = "notificationIdentifiers"
let kUsername = "username"

extension UserDefaults {
    @objc dynamic var biometricAuthenticationEnabled: Bool {
        get {
            bool(forKey: kBiometricAuthenticationEnabled)
        } set {
            setValue(newValue, forKey: kBiometricAuthenticationEnabled)
        }
    }
    
    @objc dynamic var criticalNotificationEnabled: Bool {
        get {
            bool(forKey: kCriticalNotificationEnabled)
        } set {
            setValue(newValue, forKey: kCriticalNotificationEnabled)
        }
    }
    
    @objc dynamic var isPresentingOnboarding: Bool {
        get {
            return bool(forKey: kIsPresentingOnboarding)
        } set {
            set(newValue, forKey: kIsPresentingOnboarding)
        }
    }
    
    @objc dynamic var notificationMessage: String {
        get {
            string(forKey: kNotificationMessage) ?? "Lagi apa kamu? waktunya minum nih"
        } set {
            setValue(newValue, forKey: kNotificationMessage)
        }
    }
    
    @objc dynamic var notificationIdentifiers: [String] {
        get {
            stringArray(forKey: kNotificationIdentifiers) ?? []
        } set {
            set(newValue, forKey: kNotificationIdentifiers)
        }
    }
    
    @objc dynamic var username: String {
        get {
            string(forKey: kUsername) ?? ""
        } set {
            setValue(newValue, forKey: kUsername)
        }
    }
}
