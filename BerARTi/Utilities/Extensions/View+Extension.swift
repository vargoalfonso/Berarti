//
//  View+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 25/10/22.
//

import SwiftUI

extension View {
    
    /// The Device's screen width
    @available(iOSApplicationExtension, unavailable)
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    /// The Device's screen height
    @available(iOSApplicationExtension, unavailable)
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    /// The `UIWindow` of the current app
    @available(iOSApplicationExtension, unavailable)
    var currentWindow: UIWindow? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first
    }
    
    #if canImport(UIKit)
    /// Dismisses the keyboard when touching anywhere inside the View
    @available(iOSApplicationExtension, unavailable)
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    #endif
    
    /// Round specific corners of a View object
    /// - Parameters:
    ///   - radius: The radius of the corner
    ///   - corners: Which corners you want to round
    /// - Returns: Returns the view itself
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    /// Change the Navigation Title text color
    /// - Parameter color: The Color of the text
    /// - Returns: Returns the view itself
    @available(iOSApplicationExtension, unavailable)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor]
        return self
    }
    
    /// Create a border overlaying the View object
    /// - Parameters:
    ///   - width: The width of the border
    ///   - edges: The Edges of the border
    ///   - color: The color of the border
    /// - Returns: Returns the view itself
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
