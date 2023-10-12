//
//  BloodResultViewModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 15/11/22.
//

import Foundation
import Combine

final class VitalViewModel: ObservableObject {
    private let repository = CoreDataRepository.current
    let healthManager = HealthKitManager.current
    
    @Published var bloodResultList: [BloodResultModel] = []
    
    init() {
        requestHealthKitAuthorization()
    }
    
    /// Getting all of the data contained in CoreData model
    func getAllData() {
        bloodResultList = repository.getAllBloodResults().reversed()
    }
    
    /// Request health kit API authorization for displating health data
    func requestHealthKitAuthorization() {
        healthManager.requestAuthorization()
    }
}
