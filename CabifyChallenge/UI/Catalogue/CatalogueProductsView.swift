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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Spacer()
                    .frame(height: 16.0)
                VStack(alignment: .leading) {
                    ForEach(products) { item in
                        ProductRow(
                            viewModel: ProductRowViewModel(
                                product: item
                            )
                        )
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .navigationTitle(Localization.catalogueProductsTitle)
        }
    }
}

struct CatalogueProductsView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueProductsView(products: MocksFactory.models())
    }
}
