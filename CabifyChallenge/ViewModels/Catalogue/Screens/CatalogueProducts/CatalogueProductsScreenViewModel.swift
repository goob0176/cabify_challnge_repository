//
//  CatalogueProductsScreen.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 06.02.2023.
//

import Foundation

class CatalogueProductsScreenViewModel: CatalogueProductsScreenType {
    @Published
    var checkoutItem: CheckoutItem?
    
    let products: [ProductModel]

    private var cart = [CartItem]()
    private let checkoutService: CheckoutServiceType
    
    init(
        products: [ProductModel],
        checkoutService: CheckoutServiceType = CheckoutService()
    ) {
        self.products = products
        self.checkoutService = checkoutService
    }
    
    func updateCart(with item: CartItem) {
        if let index = cart.firstIndex(where: { $0.code == item.code }) {
            cart[index] = item
        } else {
            cart.append(item)
        }
        checkoutItem = checkoutService.checkout(cart)
    }
}
