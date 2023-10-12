//
//  AppDelegate+PKPushRegistryDelegate.swift
//  BerARTi
//
//  Created by cleanmac-ada on 19/11/22.
//

import UIKit
import CallKit
import PushKit

extension AppDelegate: PKPushRegistryDelegate {
    func pushRegistry(_ registry: PKPushRegistry, didUpdate credentials: PKPushCredentials, for type: PKPushType) {

    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType) {
        
    }
    
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        completion()
    }
    
    func reportInvalidIncomingCall(completion: () -> Void) {
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: "invalid")
        let randomUUID = UUID()
        
        self.callProvider?.reportIncomingCall(with: randomUUID)
        completion()
    }
}
