//
//  ViewModelsFactory.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import Foundation
import SwiftUI

struct ViewModelsFactory {
    static func catalogue(_ networkService: DataService = NetworkService()) -> some CatalogueScreenType {
        CatalogueScreenViewModel(dataService: networkService)
    }
    
    static func catalogueProducts(_ products: [ProductModel]) -> some CatalogueProductsScreenType {
        CatalogueProductsScreenViewModel(products: products)
    }
    
    static func checkout(_ checkoutItem: CheckoutItem) -> some CheckoutViewModelType {
        CheckoutViewModel(checkoutItem: checkoutItem)
    }
    
    static func productRow(
        product: ProductModel,
        onCartItemUpdated: @escaping CartItemResponse
    ) -> some ProductRowType {
        ProductRowViewModel(
            product: product,
            discountService: DiscountService(
                type: DiscountType(rawValue: product.code ?? "")
            ),
            onCartItemUpdated: onCartItemUpdated
        )
    }
}
