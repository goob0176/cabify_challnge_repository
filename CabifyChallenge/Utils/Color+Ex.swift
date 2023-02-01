//
//  Color+Ex.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import Foundation
import SwiftUI

extension Color {
    static var primaryColor: Color {
        Color(from: 116.0, g: 64.0, b: 250.0)
    }
    
    static var errorColor: Color {
        Color(from: 211, g: 63.0, b: 84.0)
    }
    
    private init(
        from r: Double,
        g: Double,
        b: Double,
        opacity: Double = 1.0
    ) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            opacity: opacity
        )
    }
}
