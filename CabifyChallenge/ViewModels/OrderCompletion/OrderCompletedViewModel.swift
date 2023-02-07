//
//  OrderCompletedViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import Foundation

struct OrderCompletedViewModel: OrderCompletedType {
    var productsEmojis: String {
        productCodes
            .compactMap { OrderEmojiType(rawValue: $0)?.emoji }
            .joined()
    }
    
    private let productCodes: [String]
    
    init(productCodes: [String]) {
        self.productCodes = productCodes
    }
}
