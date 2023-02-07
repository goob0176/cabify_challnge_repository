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
    
    func applyDiscountIfNeeded(productsPurchased: Int, pricePerUnit: Float) -> DiscountResult {
        guard let type = type else {
            return .noDiscount
        }
        
        switch type {
        case .voucher:
            let evenNumber = evenNumber(productsPurchased: productsPurchased)
            return evenNumber > 0 ? .voucherDiscount(
                freeUnits: evenNumber / 2,
                discountValue: calculateDiscountValue(
                    from: evenNumber / 2,
                    generealPricePerUnit: pricePerUnit
                )
            ) : .noDiscount
        case .tShirt:
            return productsPurchased > Constants.tShirtDiscountBorder ? .tShirtDiscount(
                newPrice: Constants.tShirtsDiscountPrice,
                discountValue: calculateDiscountValue(
                    from: pricePerUnit,
                    and: Constants.tShirtsDiscountPrice,
                    productsPurchased: productsPurchased
                )
            ) : .noDiscount
        }
    }
}

// MARK: - Private implementation

private extension DiscountService {
     func evenNumber(productsPurchased: Int) -> Int {
        return productsPurchased % 2 == 0 ? productsPurchased : productsPurchased - 1
    }
    
    func calculateDiscountValue(from freeUnits: Int, generealPricePerUnit: Float) -> Float {
        Float(freeUnits) * generealPricePerUnit
    }
    
    func calculateDiscountValue(
        from oldPricePerUnit: Float,
        and newPricePerUnit: Float,
        productsPurchased: Int
    ) -> Float {
        (oldPricePerUnit - newPricePerUnit) * Float(productsPurchased)
    }
}
