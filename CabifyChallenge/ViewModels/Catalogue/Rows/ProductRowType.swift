//
//  ProductRowType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

protocol ProductRowType: AnyObject, ObservableObject {
    var title: String { get }
    var totalProducts: Int { get set }
    var itemsInCartMessage: String { get }
    var formattedPrice: String { get }
    var discountTitle: String? { get }
    var discountPrice: String? { get set }
    var freeUnitsMessage: String? { get set }
    
    func updateProducts(_ newNumber: Int)
}
