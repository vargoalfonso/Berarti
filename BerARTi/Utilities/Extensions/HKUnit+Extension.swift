//
//  HKUnit+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 02/12/22.
//

import Foundation
import HealthKit

extension HKUnit {
    static let countPerMinute = HKUnit.count().unitDivided(by: HKUnit.minute())
}
