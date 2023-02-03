//
//  ProductRowViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

struct ProductRowViewModel: ProductRowType {
    private let product: ProductModel
    private let priceFormatter: PriceFormatterType
    
    var title: String {
        product.name ?? ""
    }
    
    var formattedPrice: String {
        priceFormatter.format(product.price) ?? ""
    }
    
    init(
        product: ProductModel,
        priceFormatter: PriceFormatterType = PriceFormatter()
    ) {
        self.product = product
        self.priceFormatter = priceFormatter
    }
}
