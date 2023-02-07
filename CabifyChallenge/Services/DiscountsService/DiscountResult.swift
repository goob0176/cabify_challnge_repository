//
//  DiscountType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import Foundation

enum DiscountResult: Equatable {
    case voucherDiscount(freeUnits: Int, discountValue: Float)
    case tShirtDiscount(newPrice: Float, discountValue: Float)
    case noDiscount
}
