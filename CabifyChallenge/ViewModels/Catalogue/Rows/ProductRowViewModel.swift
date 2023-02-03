//
//  ProductRowViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

struct ProductRowViewModel: ProductRowType {
    let code: String?
    let name: String?
    let price: String?
    
    static func from(_ product: ProductModel) -> ProductRowViewModel {
        .init(
            code: product.code,
            name: product.name,
            price: "\(Int(product.price ?? 0.0)) €"
        )
    }
}
