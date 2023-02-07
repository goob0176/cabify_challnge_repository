//
//  ProductRowViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

// MARK: ViewModel

class ProductRowViewModel: ProductRowType {
    private let product: ProductModel
    private let priceFormatter: PriceFormatterType
    private let discountService: Discountable
    let onCartItemUpdated: CartItemResponse
    
    @Published
    var totalProducts: Int = 0
    
    @Published
    var discountPrice: String?
    
    @Published
    var freeUnitsMessage: String?
    
    var title: String {
        product.name ?? ""
    }
    
    var itemsInCartMessage: String {
        "\(Localization.itemsInCartMsg) \(totalProducts)"
    }
    
    var discountTitle: String? {
        discountService.type?.discountTitle
    }
    
    var formattedPrice: String {
        priceFormatter.format(product.price) ?? ""
    }
    
    init(
        product: ProductModel,
        priceFormatter: PriceFormatterType = PriceFormatter(),
        discountService: Discountable,
        onCartItemUpdated: @escaping CartItemResponse
    ) {
        self.product = product
        self.priceFormatter = priceFormatter
        self.discountService = discountService
        self.onCartItemUpdated = onCartItemUpdated
    }
    
    func updateProducts(_ newNumber: Int) {
        var overallDiscountValue = Float.zero
        applyDiscountIfNeeded(numberOfProducts: newNumber, overallDiscountValue: &overallDiscountValue)
        totalProducts = newNumber
        
        let cartItem = CartItem(
            code: product.code ?? "",
            totalProducts: newNumber,
            regularPrice: Float(newNumber) * (product.price ?? 0.0),
            overallDiscount: overallDiscountValue
        )
        
        onCartItemUpdated(cartItem)
    }
}

// MARK: Private implementation

private extension ProductRowViewModel {
    func applyDiscountIfNeeded(numberOfProducts: Int, overallDiscountValue: inout Float) {
        let discountResult = discountService.applyDiscountIfNeeded(
            productsPurchased: numberOfProducts,
            pricePerUnit: product.price ?? 0.0
        )
        
        switch discountResult {
        case .voucherDiscount(let freeUnits, let discountValue):
            freeUnitsMessage = "\(Localization.freeUnitsMsg) \(freeUnits)"
            overallDiscountValue = discountValue
        case .tShirtDiscount(let newPrice, let discountValue):
            discountPrice = priceFormatter.format(newPrice)
            overallDiscountValue = discountValue
        case .noDiscount:
            freeUnitsMessage = nil
            discountPrice = nil
        }
    }
}
