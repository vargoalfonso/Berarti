//
//  CallProviderManager.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 19/11/22.
//

import AVFoundation
import UIKit
import CallKit

typealias ErrorHandler = ((NSError?) -> ())

final class CallProvider: NSObject, CXProviderDelegate {
    let callManager: CallManager
    private let provider: CXProvider
    
    init(callManager: CallManager) {
        self.callManager = callManager
        provider = CXProvider.custom
        
        super.init()
     
        provider.setDelegate(self, queue: nil)
    }
    
    func reportIncomingCall(with uuid: UUID, remoteUserID: String, hasVideo: Bool, completionHandler: ErrorHandler? = nil) {
        let update = CXCallUpdate()
        update.update(with: remoteUserID, hasVideo: hasVideo, incoming: true)
        
        provider.reportNewIncomingCall(with: uuid, update: update) { error in
            guard error == nil else {
                completionHandler?(error as NSError?)
                return
            }

            self.callManager.addCall(uuid: uuid)
        }
    }
    
    func reportIncomingCall(with uuid: UUID) {
        let update = CXCallUpdate()
        update.onFailed(with: uuid)
        
        provider.reportNewIncomingCall(with: uuid, update: update) { error in
            self.provider.reportCall(with: uuid, endedAt: Date(), reason: .failed)
        }
    }
    
    func endCall(with uuid: UUID, endedAt: Date, reason: CXCallEndedReason) {
        self.provider.reportCall(with: uuid, endedAt: endedAt, reason: reason)
    }
    
    func connectedCall(with uuid: UUID) {
        self.provider.reportOutgoingCall(with: uuid, connectedAt: Date())
    }
    
    func providerDidReset(_ provider: CXProvider) {

        self.callManager.removeAllCalls()
    }
    
    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
        self.callManager.addCall(uuid: action.callUUID)
        self.connectedCall(with: action.callUUID)
        
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        NotificationCenter.default.post(name: NSNotification.Name.DidCallAccepted, object: nil)
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        NotificationCenter.default.post(name: NSNotification.Name.DidCallEnd, object: nil)
        action.fulfill()

        self.callManager.removeAllCalls()
    }
    
    func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
        switch action.isOnHold {
        case true:
            action.fulfill()
        case false:
            action.fulfill()
        }
    }
    
    func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {

    }
    
    func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {

    }
}
