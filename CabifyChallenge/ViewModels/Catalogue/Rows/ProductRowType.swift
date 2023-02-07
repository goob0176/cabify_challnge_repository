//
//  ProductRowType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

typealias CartItemResponse = (CartItem)->Void

protocol ProductRowType: AnyObject, ObservableObject {
    var totalProducts: Int { get set }
    
    var title: String { get }
    var itemsInCartMessage: String { get }
    var formattedPrice: String { get }
    var discountTitle: String? { get }
    var discountPrice: String? { get set }
    var freeUnitsMessage: String? { get set }
    
    var onCartItemUpdated: CartItemResponse { get }
    
    func updateProducts(_ newNumber: Int)
}
