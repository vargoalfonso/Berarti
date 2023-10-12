//
//  Color+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

extension Color {
    static let TEXT_GRAY = Color("Text Gray")
    static let TEXT_DARK_GRAY = Color("Text Dark Gray")
    static let TEXT_DARK_GREEN = Color("Text Dark Green")
    static let TEXT_PRIMARY_GREEN = Color("Text Primary Green")
    static let TEXT_DISABLED = Color("Text Disabled")
    static let TEXTEDITOR_BACKGROUND = Color("TextEditor Background")
    static let TEXTEDITOR_BORDER = Color("TextEditor Border")
    static let PAGE_INDICATOR_ACTIVE = Color("Page Indicator Active")
    static let PAGE_INDICATOR_INACTIVE = Color("Page Indicator Inactive")
    static let BUTTON_PRIMARY_BACKGROUND = Color("Button Primary Background")
    static let CARD_BACKGROUND = Color("Card Background")
    static let NAVIGATION_BAR_BACKGROUND = Color("Navigation Bar Background")
    static let NAVIGATION_TITLE = Color("Navigation Title")
    static let PICKER_BACKGROUND = Color("Picker Background")
    
    // Source: https://stackoverflow.com/questions/56874133/use-hex-color-in-swiftui
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: 
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue:  Double(b) / 255, opacity: Double(a) / 255)
    }
}
