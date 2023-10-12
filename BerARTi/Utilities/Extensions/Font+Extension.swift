//
//  Font+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

extension Font {
    static func defaultFont(size: CGFloat, weight: Weight = .regular) -> Font {
        Font.system(size: size, weight: weight, design: .rounded)
    }
}
