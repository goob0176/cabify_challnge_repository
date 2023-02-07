//
//  MocksFactory.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

enum ProductRowMockModel: Int {
    case voucher
    case tShirt
    case mug
}

struct MocksFactory {
    static func models() -> [ProductModel] {
        [
            ProductModel(code: "VOUCHER", name: "Cabify Voucher", price: 5),
            ProductModel(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
            ProductModel(code: "MUG", name: "Cabify Coffee Mug", price: 7.5),
        ]
    }    
    static func row(
        _ type: ProductRowMockModel,
        onVoucherCartItemUpdated: CartItemResponse? = nil
    ) -> some ProductRowType {
        ViewModelsFactory.productRow(
            product: MocksFactory.models()[type.rawValue],
            onCartItemUpdated: onVoucherCartItemUpdated ?? {_ in}
        )
    }
}
