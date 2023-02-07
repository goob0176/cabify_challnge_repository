//
//  CheckoutViewModelType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 06.02.2023.
//

import Foundation

protocol CheckoutViewModelType {
    var totalProducts: Int { get }
    var totalPrice: String { get }
    var discountValue: String { get }
    var priceWithDiscount: String { get }
}
