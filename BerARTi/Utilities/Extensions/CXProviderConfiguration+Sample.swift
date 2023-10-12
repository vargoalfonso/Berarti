//
//  CXProviderConfiguration+Sample.swift
//  BerARTi
//
//  Created by Vargo Alfonso on 19/11/22.
//

import UIKit
import CallKit

extension CXProviderConfiguration {
    static var custom: CXProviderConfiguration {
        let configuration = CXProviderConfiguration(localizedName: "App Name Here")

        configuration.supportsVideo = true
        configuration.maximumCallsPerCallGroup = 1

        configuration.supportedHandleTypes = [.generic]
        if let iconImage = UIImage(named: "App Icon") {
            configuration.iconTemplateImageData = iconImage.pngData()
        }
        configuration.ringtoneSound = "Rington.caf"
        
        return configuration
    }
}
