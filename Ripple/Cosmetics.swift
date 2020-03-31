//
//  Cosmetics.swift
//  Footnote2
//
//  Created by Cameron Bardell on 2019-12-10.
//  Copyright © 2019 Cameron Bardell. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
    
    // Palette 1

    static let rippleBlue = Color(UIColor.rippleBlue)
    static let rippleOrange = Color(UIColor.rippleOrange)
    static let rippleYellow = Color(UIColor.rippleYellow)
    static let rippleGreen = Color(UIColor.rippleGreen)
    static let rippleDarkGreen = Color(UIColor.rippleDarkGreen)
    
    
}

// Dismiss keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
