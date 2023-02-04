//
//  PurchasesService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

class PurchasesService: PurchasesServiceType, ObservableObject {
    var totalPrice: Float = 0.0
    @Published var itemsPurchased = 0

    func handlePurchases(_ products: [ProductModel]) {
        itemsPurchased = products.count
        totalPrice = products.reduce(0) { $0 + ($1.price ?? 0.0) }
    }
}
