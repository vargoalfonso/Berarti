//
//  SecondaryButtonStyle.swift
//  BerARTi
//
//  Created by cleanmac-ada on 27/10/22.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .font(.system(size: 15))
            .foregroundColor(Color.BUTTON_PRIMARY_BACKGROUND)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.BUTTON_PRIMARY_BACKGROUND, lineWidth: 1.5))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
