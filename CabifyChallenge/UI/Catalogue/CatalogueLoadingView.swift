//
//  CatalogueLoadingView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

// MARK: - Constants

private struct Constants {
    static let betweenSpacing = 100.0
    static let headerFontSize = 64.0
    static let messageFontSize = 34.0
}

// MARK: - View

struct CatalogueLoadingView: View {
    private let isLoading: Bool
    
    init(isLoading: Bool = true) {
        self.isLoading = isLoading
    }
    
    var body: some View {
        ZStack {
            Color.primaryColor
            VStack(spacing: Constants.betweenSpacing) {
                LoadingIndicator(isLoading: isLoading)
                VStack(alignment: .leading) {
                    Text(Localization.productsLoadingHeaderEmg)
                        .font(.system(size: Constants.headerFontSize))
                    Text(Localization.productsLoadingMsg)
                        .foregroundColor(.white)
                        .font(.system(size: Constants.messageFontSize, weight: .heavy))
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Previews

struct CatalogueLoadingViewPreviews: PreviewProvider {
    static var previews: some View {
        CatalogueLoadingView(isLoading: false)
    }
}
