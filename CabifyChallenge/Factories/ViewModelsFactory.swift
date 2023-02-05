//
//  ViewModelsFactory.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import Foundation
import SwiftUI

struct ViewModelsFactory {
    static func catalogueViewModel(_ networkService: DataService = NetworkService()) -> some CatalogueScreenType {
        CatalogueScreenViewModel(dataService: networkService)
    }
    
    static func productRowViewModel(product: ProductModel) -> some ProductRowType {
        ProductRowViewModel(
            product: product,
            discountService: DiscountService(
                type: DiscountType(rawValue: product.code ?? "")
            )
        )
    }
}
