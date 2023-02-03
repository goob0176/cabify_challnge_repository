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
}

private extension String {
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
