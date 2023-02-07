//
//  PrimaryButton.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import SwiftUI

struct PrimaryButton: View {
    private static let kTextFont: Font = .system(size: 20.0, weight: .bold)
    
    let title: String
    let textColor: Color
    let action: ()->Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(textColor)
                    .font(Self.kTextFont)
                    .padding()
                    .background(Color.white)
                    .clipShape(Capsule())
            })
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(
            title: "Button",
            textColor: .errorColor,
            action: {}
        )
    }
}
