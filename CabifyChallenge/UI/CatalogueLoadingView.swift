//
//  CatalogueLoadingView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

struct CatalogueLoadingView: View {
    @State
    private var animateOpacity = false
    
    var body: some View {
        ZStack {
            Color.primaryColor
            VStack(spacing: 100.0) {
                LoadingIndicator()
                VStack(alignment: .leading) {
                    Text(Localization.productsLoadingHeaderEmg)
                        .font(.system(size: 64))
                    Text(Localization.productsLoadingMsg)
                        .foregroundColor(.white)
                        .font(.system(size: 34.0, weight: .heavy))
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea()
        .opacity(animateOpacity ? 1.0 : 0.0)
        .onAppear {
            withAnimation {
                animateOpacity = true
            }
        }
    }
}

struct CatalogueLoadingViewPreviews: PreviewProvider {
    static var previews: some View {
        CatalogueLoadingView()
    }
}
