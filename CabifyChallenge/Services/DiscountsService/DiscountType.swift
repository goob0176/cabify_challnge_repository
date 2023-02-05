//
//  DiscountType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import Foundation

enum DiscountType: String {
    case voucher = "VOUCHER"
    case tShirt = "TSHIRT"
}

extension DiscountType {
    var discountTitle: String {
        switch self {
        case .tShirt:
            return Localization.tshirtDiscountTitle
        case .voucher:
            return Localization.voucherDiscountTitle
        }
    }
}
