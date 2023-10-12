//
//  HealthKitManager.swift
//  BerARTi
//
//  Created by cleanmac-ada on 01/12/22.
//

import Foundation
import Combine
import HealthKit

final class HealthKitManager: ObservableObject {
    static let current = HealthKitManager()
    
    private let healthStore = HKHealthStore()
    private let quantityTypes: Set<HKQuantityType> = [
        HKQuantityType.quantityType(forIdentifier: .heartRate)!,
        HKQuantityType.quantityType(forIdentifier: .oxygenSaturation)!,
        HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic)!,
        HKQuantityType.quantityType(forIdentifier: .bloodPressureDiastolic)!,
        HKQuantityType.quantityType(forIdentifier: .respiratoryRate)!
    ]
    
    @Published private(set) var heartRateData: HKQuantitySample? = nil
    @Published private(set) var oxygenSaturationData: HKQuantitySample? = nil
    @Published private(set) var bloodPressureSystolicData: HKQuantitySample? = nil
    @Published private(set) var bloodPressureDiastolicData: HKQuantitySample? = nil
    @Published private(set) var respiratoryRateData: HKQuantitySample? = nil
    
    private init() {}
    
    /// Request HealthKit API authorization for displating health data
    func requestAuthorization() {
        healthStore.requestAuthorization(toShare: nil, read: quantityTypes, completion: { [unowned self] success, error in
            if success {
                self.retrieveAllTheRequiredData()
            } else {
                print("Authorization failed")
            }
        })
    }
    
    /// Retrieving the latest required data
    func retrieveAllTheRequiredData() {
        retrieveLatestQuantitativeData(.heartRate) { [unowned self] sample in
            self.heartRateData = sample
        }
        retrieveLatestQuantitativeData(.oxygenSaturation) { [unowned self] sample in
            self.oxygenSaturationData = sample
        }
        retrieveLatestQuantitativeData(.bloodPressureSystolic) { [unowned self] sample in
            self.bloodPressureSystolicData = sample
        }
        retrieveLatestQuantitativeData(.bloodPressureDiastolic) { [unowned self] sample in
            self.bloodPressureDiastolicData = sample
        }
        retrieveLatestQuantitativeData(.respiratoryRate) { [unowned self] sample in
            self.respiratoryRateData = sample
        }
    }
    
    /// Retrieving the latest qualitative data based on type
    /// - Parameters:
    ///   - type: The `HKQualitative` type
    ///   - completion: The completion handler after querying the data
    private func retrieveLatestQuantitativeData(_ type: HKQuantityTypeIdentifier, completion: @escaping (HKQuantitySample?) -> Void = { _ in }) {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: type) else { return }
        
        let predicate = HKQuery.predicateForSamples(withStart: nil, end: Date.endingDay)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: 1, sortDescriptors: [sortDescriptor]) { query, result, error in
            guard error == nil, let latestSample = result?.last as? HKQuantitySample else { return }
            completion(latestSample)
        }
        healthStore.execute(query)
    }
}
