//
//  CheckoutViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 06.02.2023.
//

import Foundation

struct CheckoutViewModel: CheckoutViewModelType {
    var totalProducts: Int {
        checkoutItem.totalItems
    }
    var totalPrice: String {
        priceFormatter.format(checkoutItem.totalPrice) ?? ""
    }
    var discountValue: String {
        guard checkoutItem.totalDiscount != 0,
        let formattedValue = priceFormatter.format(checkoutItem.totalDiscount) else {
            return ""
        }
        return formattedValue
    }
    var priceWithDiscount: String {
        guard checkoutItem.totalDiscount != 0 else {
            return ""
        }
        let saveValue = checkoutItem.totalPrice - checkoutItem.totalDiscount
        return priceFormatter.format(saveValue) ?? ""
    }
    
    private let checkoutItem: CheckoutItem
    private let priceFormatter: PriceFormatter
    
    init(
        checkoutItem: CheckoutItem,
        priceFormatter: PriceFormatter = PriceFormatter()
    ) {
        self.checkoutItem = checkoutItem
        self.priceFormatter = priceFormatter
    }
}
