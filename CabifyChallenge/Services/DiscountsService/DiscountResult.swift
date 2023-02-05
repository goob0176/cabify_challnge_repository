//
//  DiscountType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import Foundation

enum DiscountResult {
    case voucherDiscount(freeUnits: Int)
    case tShirtDiscount(newPrice: Float)
    case noDiscount
}
