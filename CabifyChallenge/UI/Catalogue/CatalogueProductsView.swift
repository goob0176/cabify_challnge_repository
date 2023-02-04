//
//  CatalogueProductsView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import SwiftUI

struct CatalogueProductsView: View {
    private let products: [ProductModel]
    
    init(products: [ProductModel]) {
        self.products = products
    }
    
    static private let kOffsetSpacerHeight = 16.0
    
    @State
    private var toggleAnim = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    Spacer()
                        .frame(height: Self.kOffsetSpacerHeight)
                    VStack(alignment: .leading) {
                        ForEach(products) { item in
                            ProductRow(
                                viewModel: ProductRowViewModel(
                                    product: item
                                )
                            )
                        }
                        Button("Test") {
                            withAnimation {
                                toggleAnim.toggle()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .navigationTitle(Localization.catalogueProductsTitle)
                if toggleAnim {
                    VStack {
                        Spacer()
                        OverallPurchasesView()
                    }
                    .transition(.move(edge: .bottom))
                }
                
            }
        }
    }
}

struct CatalogueProductsView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueProductsView(products: MocksFactory.models())
    }
}
