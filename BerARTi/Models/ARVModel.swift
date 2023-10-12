//
//  ARVModel.swift
//  BerARTi
//
//  Created by cleanmac-ada on 11/11/22.
//

import Foundation

struct ARVModel: Hashable {
    var id: Int
    var name: String
}

extension ARVModel {
    /// Getting a list of ARV of unit-type
    /// - Returns: Returns an array of ARV models
    static func getUnitAll() -> [ARVModel] {
        [
            ARVModel(id: 10, name: "Tenovofir"),
            ARVModel(id: 11, name: "Abacavir"),
            ARVModel(id: 12, name: "Lamivudine"),
            ARVModel(id: 13, name: "Dolutegravir"),
            ARVModel(id: 14, name: "Efavirenz"),
            ARVModel(id: 16, name: "Nevirapine"),
            ARVModel(id: 17, name: "Rilpivirine"),
        ]
    }
    
    /// Getting a list of ARV of combination-type
    /// - Returns: Returns an array of ARV models
    static func getCombinationAll() -> [ARVModel] {
        [
            ARVModel(id: 20, name: "Tenovofir/Lamivudine/Dolutegravir"),
            ARVModel(id: 21, name: "Tenovofir/Lamivudine/Efavirenz"),
            ARVModel(id: 22, name: "Tenovofir/Emtricitabine"),
            ARVModel(id: 23, name: "Zidovudine/Lamivudine"),
            ARVModel(id: 24, name: "Lopinavir/Ritonavir"),
        ]
    }
}
