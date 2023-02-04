//
//  PurchasesServiceType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

protocol PurchasesServiceType: AnyObject {
    var totalPrice: Float { get set }
    var itemsPurchased: Int { get set }
    
    func handlePurchases(_ products: [ProductModel])
}
