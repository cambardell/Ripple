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
    static let rippleDarkBlue = Color(UIColor.rippleDarkBlue)
    static let rippleBrightYellow = Color(UIColor.rippleBrightYellow)
    static let rippleBrightOrange = Color(UIColor.rippleBrightOrange)
    static let rippleRed = Color(UIColor.rippleRed)
    static let rippleNewGreen = Color(UIColor.rippleNewGreen)
    
    
}

// Dismiss keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

// For bordering only certain edges. From stackoverflow
struct EdgeBorder: Shape {

    var width: CGFloat
    var edge: Edge

    func path(in rect: CGRect) -> Path {
        var x: CGFloat {
            switch edge {
            case .top, .bottom, .leading: return rect.minX
            case .trailing: return rect.maxX - width
            }
        }

        var y: CGFloat {
            switch edge {
            case .top, .leading, .trailing: return rect.minY
            case .bottom: return rect.maxY - width
            }
        }

        var w: CGFloat {
            switch edge {
            case .top, .bottom: return rect.width
            case .leading, .trailing: return self.width
            }
        }

        var h: CGFloat {
            switch edge {
            case .top, .bottom: return self.width
            case .leading, .trailing: return rect.height
            }
        }

        return Path( CGRect(x: x, y: y, width: w, height: h) )
    }
}

extension View {
    func border(width: CGFloat, edge: Edge, color: Color) -> some View {
        ZStack {
            self
            EdgeBorder(width: width, edge: edge).foregroundColor(color)
        }
    }
}

// Basic text modifier for most of the app.
struct basicText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Jost", size: 20))
    }
}

struct headingText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("JosefinSans-Light", size: 30))
    }
}

struct titleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("JosefinSans-Regular", size: 40))
    }
}
