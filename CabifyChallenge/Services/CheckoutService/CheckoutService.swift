//
//  CheckoutService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

struct CheckoutService: CheckoutServiceType {
    func checkout(_ cart: [CartItem]) -> CheckoutItem {
        CheckoutItem(
            totalItems: cart.reduce(0) {$0 + $1.totalProducts},
            totalPrice: cart.reduce(0) {$0 + $1.regularPrice},
            totalDiscount: cart.reduce(0) {$0 + $1.overallDiscount}
        )
    }
}
