//
//  CatalogueProductsScreenType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 06.02.2023.
//

import Foundation

protocol CatalogueProductsScreenType: AnyObject, ObservableObject {
    var products: [ProductModel] { get }
    var checkoutItem: CheckoutItem? { get set }
    var orderCodes: [String] { get }
    var showPurchaseCompletedScreen: Bool { get set }
    
    func updateCart(with item: CartItem)
}
