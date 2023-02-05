//
//  PurchasesServiceType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

protocol PurchasesServiceType: AnyObject {
    var store: [ProductModel] { get }
    var totalPrice: Float { get set }
    
    func add(_ product: ProductModel)
    func remove(_ product: ProductModel)
}
