//
//  Data+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 19/11/22.
//

import Foundation

extension Data {
    func toHexString() -> String {
        return self.map { String(format: "%02x", $0) }.joined()
    }
}
