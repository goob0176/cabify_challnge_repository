//
//  CatalogueErrorView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

// MARK: Constants

private struct Constants {
    static let generalSpacing = 20.0
    static let errorMessageScaleFactor = 0.8
    static let overallBottomPadding = 50.0
    static let generalFont: Font = .system(size: 20.0, weight: .bold)
    static let errorEmojiFont: Font = .system(size: 64.0)
    static let errorHeaderFont: Font = .system(size: 40.0, weight: .heavy)
}

// MARK: - View

struct CatalogueErrorView: View {
    private let errorMessage: String
    private let refreshAction: ()->Void
    
    init(
        errorMessage: String,
        refreshAction: @escaping ()->Void
    ) {
        self.errorMessage = errorMessage
        self.refreshAction = refreshAction
    }
    
    var body: some View {
        ZStack {
            Color.errorColor
            VStack {
                Spacer()
                VStack {
                    Text(Localization.productsErrorEmg)
                        .font(Constants.errorEmojiFont)
                    VStack(spacing: Constants.generalSpacing) {
                        Text(Localization.productsErrorHeader)
                            .foregroundColor(.white)
                            .font(Constants.errorHeaderFont)
                        Text(errorMessage)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(Constants.errorMessageScaleFactor)
                            .foregroundColor(.white)
                            .font(Constants.generalFont)
                            .padding(.horizontal)
                    }
                }
                Spacer()
                Button(
                    action: refreshAction,
                    label: {
                        Text(Localization.errorButtonTitle)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.errorColor)
                            .font(Constants.generalFont)
                            .padding()
                            .background(Color.white)
                            .clipShape(Capsule())
                    })
                .padding(.horizontal)
                .padding(.bottom, Constants.overallBottomPadding)
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Previews

struct CatalogueErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueErrorView(
            errorMessage: "Something went wrong",
            refreshAction: {}
        )
    }
}
