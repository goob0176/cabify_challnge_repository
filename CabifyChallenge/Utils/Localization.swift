//
//  Localization.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation

struct Localization {
    static let invalidUrlErrorMsg = "INVALID_URL_ERROR_MSG".localized
    static let serverErrorMsg = "SERVER_ERROR_MSG".localized
    static let productsLoadingMsg = "PRODUCTS_LOADING_MSG".localized
    static let productsLoadingHeaderEmg = "PRODUCTS_LOADING_HEADER_EMG".localized
    static let productsErrorEmg = "PRODUCTS_ERROR_EMG".localized
    static let productsErrorHeader = "PRODUCTS_ERROR_HEADER".localized
    static let errorButtonTitle = "ERROR_BUTTON_TITLE".localized
    static let productsHeaderEmg = "PRODUCTS_HEADER_EMG".localized
    static let catalogueProductsTitle = "CATALOGUE_PRODUCTS_TITLE".localized
    static let itemsInCartMsg = "ITEMS_IN_CART_MSG".localized
    static let addToCartButtonTitle = "ADD_TO_CART_BUTTON_TITLE".localized
    static let voucherDiscountTitle = "VOUCHER_DISCOUNT_TITLE".localized
    static let tshirtDiscountTitle = "TSHIRT_DISCOUNT_TITLE".localized
    static let freeUnitsMsg = "FREE_UNITS_MSG".localized
    static let itemsPurchasedMsg = "ITEMS_PURCHASED_MSG".localized
    static let yourPriceMsg = "YOUR_PRICE_MSG".localized
    static let oldPriceMsg = "OLD_PRICE_MSG".localized
    static let newPriceMsg = "NEW_PRICE_MSG".localized
    static let youSaveMsg = "YOU_SAVE_MSG".localized
    static let purchaseButtonTitle = "PURCHASE_BUTTON_TITLE".localized
    static let orderCompletedHeader = "ORDER_COMPLETED_HEADER".localized
    static let orderCompletedButtonTitle = "ORDER_COMPLETED_BUTTON_TITLE".localized
    static let voucherEmg = "VOUCHER_EMG".localized
    static let tShirtEmg = "TSHIRT_EMG".localized
    static let mugEmg = "MUG_EMG".localized
}

private extension String {
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
