//
//  UIStackView+Extension.swift
//  BerARTi
//
//  Created by cleanmac-ada on 28/11/22.
//

import UIKit

extension UIStackView {
    /// Adds multiple views to the arranged subviews array.
    /// - Parameter subviews: The views to add to the array of views arranged by the stack.
    func addArrangedSubviews(_ subviews: UIView...) {
        for view in subviews {
            addArrangedSubview(view)
        }
    }
}
