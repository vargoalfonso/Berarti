//
//  MainTabViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/11/22.
//

import Foundation
import Combine
import SwiftUI
import LocalAuthentication

final class MainTabViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    private let authenticationContext = LAContext()
    private var authenticationError: NSError?
    
    @AppStorage(kBiometricAuthenticationEnabled) var biometricAuthenticationEnabled: Bool = false
    @Published var isPresentingAuthenticationView: Bool = false
    
    /// Authenticate to app with biometric authentication, if enabled.
    func authenticate() {
        if biometricAuthenticationEnabled {
            if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authenticationError) {
                withAnimation {
                    isPresentingAuthenticationView = true
                }
                let reason = "This app needs your permission to enable Biometric Authentication access"
                authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [unowned self] success, error in
                    if success {
                        withAnimation {
                            DispatchQueue.main.async {
                                self.isPresentingAuthenticationView = false
                            }
                        }
                    }
                }
            }
        }
    }
}
