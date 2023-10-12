//
//  SettingsViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 17/11/22.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage(kBiometricAuthenticationEnabled) var biometricAuthenticationEnabled: Bool = false
    @AppStorage(kCriticalNotificationEnabled) var criticalNotificationEnabled: Bool = false
    
    private var previewOptions = ["Setiap Saat", "5 Menit", "10 Menit", "15 Menit", "30 Menit", "60 Menit"]
    
    func showShareActionSheet() {
        guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
}
