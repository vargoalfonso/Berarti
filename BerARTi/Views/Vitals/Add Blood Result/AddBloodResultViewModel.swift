//
//  AddBloodResultViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 15/11/22.
//

import Foundation
import Combine
import SwiftUI

final class AddBloodViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    
    @Published var selectedDate: Date = Date()
    @Published var selectedTime: Date = Date()
    @Published var cd4Amount: String = ""
    @Published var viralLoadAmount: String = ""
    
    @Published var isCancelModalPresented: Bool = false
    @Published var isValidationModalPresented: Bool = false
    @Published var isSuccessModalPresented: Bool = false
    
    /// Validating whether all of the data has been inputted by the user.
    /// - Returns: Returns `true` if all of the data has been inputted, `false` if some/all of the data hasn't been inputted.
    func validateData() -> Bool {
        !cd4Amount.isEmpty && !viralLoadAmount.isEmpty
    }
    
    /// Saving the blood result data to CoreData model
    func saveData() {
        if validateData() {
            let bloodResultModel = BloodResultModel(bloodResultId: UUID(),
                                                    testDate: selectedDate,
                                                    testTime: selectedTime,
                                                    cd4Amount: Int(cd4Amount) ?? 0,
                                                    viralLoadAmount: Int(viralLoadAmount) ?? 0)
            repository.saveBloodResult(bloodResultModel)
            withAnimation {
                isSuccessModalPresented = true
            }
        } else {
            withAnimation {
                isValidationModalPresented = true
            }
        }
    }
    
}
