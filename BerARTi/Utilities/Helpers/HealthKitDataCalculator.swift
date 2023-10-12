//
//  HealthDataCalculator.swift
//  BerARTi
//
//  Created by cleanmac-ada on 02/12/22.
//

import Foundation
import HealthKit

final class HealthDataCalculator {
    
    /// Calculate Heart Rate value quantity from a `HKQuantitySample` object
    /// - Parameter sample: The sample required to calculate data
    /// - Returns: Returns a String representation of the calculated data
    static func calculateHeartRateValue(_ sample: HKQuantitySample) -> String {
        String(format: "%.0f", sample.quantity.doubleValue(for: .countPerMinute))
    }
    
    /// Calculate Oxygen Saturation percentage value quantity from a `HKQuantitySample` object
    /// - Parameter sample: The sample required to calculate data
    /// - Returns: Returns a String representation of the calculated data
    static func calculateOxygenSaturationValue(_ sample: HKQuantitySample) -> String {
        String(format: "%.0f", Double(sample.quantity.doubleValue(for: .percent()) * 100))
    }
    
    /// Calculate Blood Pressure value quantity from a `HKQuantitySample` object
    /// - Parameters:
    ///   - systolic: The systolic value of the sample object
    ///   - diastolic: The diastolic value of the sample object
    /// - Returns: Returns a String representation of the calculated data
    static func calculateBloodPressureValue(_ systolic: HKQuantitySample, _ diastolic: HKQuantitySample) -> String {
        let systolicAmount = String(format: "%.0f", systolic.quantity.doubleValue(for: .millimeterOfMercury()))
        let diastolicAmount = String(format: "%.0f", diastolic.quantity.doubleValue(for: .millimeterOfMercury()))
        return "\(systolicAmount)/\(diastolicAmount)"
    }
    
    /// Calculate Respiratory Rate value quantity from a `HKQuantitySample` object
    /// - Parameter sample: The sample required to calculate data
    /// - Returns: Returns a String representation of the calculated data
    static func calculateRespiratoryRateValue(_ sample: HKQuantitySample) -> String {
        String(format: "%.0f", sample.quantity.doubleValue(for: .countPerMinute))
    }
}
