//
//  CatalogueErrorView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

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
                        .font(.system(size: 64.0))
                    VStack(spacing: 20.0) {
                        Text(Localization.productsErrorHeader)
                            .foregroundColor(.white)
                            .font(.system(size: 40.0, weight: .heavy))
                        Text(errorMessage)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.8)
                            .foregroundColor(.white)
                            .font(.system(size: 20.0, weight: .bold))
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
                            .font(.system(size: 20.0, weight: .bold))
                            .padding()
                            .background(Color.white)
                            .clipShape(Capsule())
                    })
                .padding(.horizontal)
                .padding(.bottom, 50.0)
            }
        }
        .ignoresSafeArea()
    }
}

struct CatalogueErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueErrorView(
            errorMessage: "Something went wrong",
            refreshAction: {}
        )
    }
}
