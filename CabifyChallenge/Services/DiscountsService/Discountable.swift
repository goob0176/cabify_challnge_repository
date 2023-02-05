//
//  Discountable.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import Foundation

protocol Discountable {
    var type: DiscountType? { get }
    func applyDiscountIfNeeded(productsPurchased: Int) -> DiscountResult
}
