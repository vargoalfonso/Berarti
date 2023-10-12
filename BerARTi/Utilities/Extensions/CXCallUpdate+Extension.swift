//
//  CXCallUpdate+Extension.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 19/11/22.
//

import CallKit

extension CXCallUpdate {
    func update(with remoteUserID: String, hasVideo: Bool, incoming: Bool) {
        let remoteHandle = CXHandle(type: .generic, value: remoteUserID)
        
        self.remoteHandle = remoteHandle
        self.localizedCallerName = remoteUserID
        self.hasVideo = hasVideo
    }
    
    func onFailed(with uuid: UUID) {
        let remoteHandle = CXHandle(type: .generic, value: "Unknown")
        
        self.remoteHandle = remoteHandle
        self.localizedCallerName = "Unknown"
        self.hasVideo = false
    }
}
