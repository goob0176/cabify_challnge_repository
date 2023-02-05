//
//  DiscountService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import Foundation

// MARK: - Constants

private struct Constants {
    static let tShirtDiscountBorder = 2
    static let tShirtsDiscountPrice = Float(19.0)
}

// MARK: - Service

struct DiscountService: Discountable {
    let type: DiscountType?
    
    func applyDiscountIfNeeded(productsPurchased: Int) -> DiscountResult {
        guard let type = type else {
            return .noDiscount
        }
        
        switch type {
        case .voucher:
            let evenNumber = evenNumber(productsPurchased: productsPurchased)
            return evenNumber > 0 ? .voucherDiscount(freeUnits: evenNumber / 2) : .noDiscount
        case .tShirt:
            return productsPurchased > Constants.tShirtDiscountBorder ? .tShirtDiscount(newPrice: Constants.tShirtsDiscountPrice) : .noDiscount
        }
    }
    
    private func evenNumber(productsPurchased: Int) -> Int {
        return productsPurchased % 2 == 0 ? productsPurchased : productsPurchased - 1
    }
}
