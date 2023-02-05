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
    
    @Published
    var discountPrice: String?
    
    @Published
    var freeUnitsMessage: String?
    
    var title: String {
        product.name ?? ""
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
        discountService: Discountable
    ) {
        self.product = product
        self.priceFormatter = priceFormatter
        self.discountService = discountService
    }
    
    func updateProducts(_ newNumber: Int) {
        applyDiscountIfNeeded(numberOfProducts: newNumber)
    }
}

// MARK: Private implementation

private extension ProductRowViewModel {
    func applyDiscountIfNeeded(numberOfProducts: Int) {
        let discountResult = discountService.applyDiscountIfNeeded(productsPurchased: numberOfProducts)
        
        switch discountResult {
        case .voucherDiscount(let freeUnits):
            freeUnitsMessage = "\(Localization.freeUnitsMsg) \(freeUnits)"
        case .tShirtDiscount(let newPrice):
            discountPrice = priceFormatter.format(newPrice)
        case .noDiscount:
            freeUnitsMessage = nil
            discountPrice = nil
        }
    }
}
