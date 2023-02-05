//
//  PurchasesService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

class PurchasesService: PurchasesServiceType {
    var totalPrice: Float = 0.0    
    private(set) var store = [ProductModel]()
    
    func add(_ product: ProductModel) {
        store.append(product)
        updatePrice()
    }
    
    func remove(_ product: ProductModel) {
        guard let firstIndex = store.firstIndex(of: product) else {
            return
        }
        store.remove(at: firstIndex)
        updatePrice()
    }
    
    private func updatePrice() {
        totalPrice = store.reduce(0) { $0 + ($1.price ?? 0.0) }
    }
}
