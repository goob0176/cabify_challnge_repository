//
//  SpecialOfferBadgeView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import SwiftUI

// MARK: - Constants

private struct Constants {
    static let titleLineLimit = 1
    static let titleMinimumScaleFactor = 0.8
    static let titleFontSize = 14.0
    static let titleVerticalPadding = 10.0
    static let cornerRadius = 18.5
    static let strokeLineWidth = 2.0
}

// MARK: - View

struct SpecialOfferBadgeView: View {
    let width: CGFloat
    let title: String?
    
    var body: some View {
        Text(title ?? "")
            .frame(width: width)
            .lineLimit(Constants.titleLineLimit)
            .minimumScaleFactor(Constants.titleMinimumScaleFactor)
            .foregroundColor(.primaryColor)
            .font(.system(size: Constants.titleFontSize, weight: .bold))
            .padding(.vertical, Constants.titleVerticalPadding)
            .padding(.horizontal)
            .overlay(
                RoundedRectangle(
                    cornerRadius: Constants.cornerRadius
                )
                    .stroke(
                        Color.primaryColor,
                        lineWidth: Constants.strokeLineWidth
                    )
            )
            .background(Color.white.cornerRadius(Constants.cornerRadius))
            .opacity(title != nil ? 1.0 : 0.0)
    }
}

// MARK: - Preview

struct SpecialOfferBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialOfferBadgeView(
            width: 200.0,
            title: "Every third - off!"
        )
    }
}
