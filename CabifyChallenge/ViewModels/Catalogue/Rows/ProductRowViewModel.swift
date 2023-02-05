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
    private let discountService: Discountable
    
    var title: String {
        product.name ?? ""
    }
    
    var discountTitle: String? {
        discountService.type?.discountTitle
    }
    
    var formattedPrice: String {
        priceFormatter.format(product.price) ?? ""
    }
    
    init(
        product: ProductModel,
        priceFormatter: PriceFormatterType = PriceFormatter(),
        discountService: Discountable
    ) {
        self.product = product
        self.priceFormatter = priceFormatter
        self.discountService = discountService
    }
}
