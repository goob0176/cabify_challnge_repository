//
//  OrderEmojiType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import Foundation

enum OrderEmojiType: String {
    case voucher = "VOUCHER"
    case tShirt = "TSHIRT"
    case mug = "MUG"
    
    var emoji: String {
        switch self {
        case .voucher:
            return Localization.voucherEmg
        case .tShirt:
            return Localization.tShirtEmg
        case .mug:
            return Localization.mugEmg
        }
    }
}
