//
//  AppDelegate.swift
//  berARTi
//
//  Created by cleanmac-ada on 20/10/22.
//

import UIKit
import PushKit

final class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    let pushRegistry = PKPushRegistry(queue: DispatchQueue.main)
    let callManager = CallManager()
    var callProvider: CallProvider?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Task {
            try await LocalNotificationManager.current.requestAuthorization()
        }
        
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]
        
        callProvider = CallProvider(callManager: callManager)
        
        return true
    }
}
