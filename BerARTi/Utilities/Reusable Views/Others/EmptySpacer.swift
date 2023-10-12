//
//  EmptySpacer.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/10/22.
//

import SwiftUI

struct EmptySpacer: View {
    
    private let width: CGFloat
    private let height: CGFloat
    
    init(width: CGFloat = 0, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Color.clear
            .frame(width: width, height: height)
    }
}
