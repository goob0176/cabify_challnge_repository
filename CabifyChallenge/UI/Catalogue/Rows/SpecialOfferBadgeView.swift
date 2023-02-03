//
//  SpecialOfferBadgeView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import SwiftUI

struct SpecialOfferBadgeView: View {
    let width: CGFloat
    let title: String?
    
    var body: some View {
        Text(title ?? "")
            .frame(width: width)
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .foregroundColor(.primaryColor)
            .font(.system(size: 14.0, weight: .bold))
            .padding(.vertical, 10.0)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(
                    cornerRadius: 18.5
                )
                    .stroke(
                        Color.primaryColor,
                        lineWidth: 2.0
                    )
            )
            .background(Color.white.cornerRadius(18.5))
            .opacity(title != nil ? 1.0 : 0.0)
    }
}

struct SpecialOfferBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialOfferBadgeView(
            width: 200.0,
            title: "Every third - off!"
        )
    }
}
