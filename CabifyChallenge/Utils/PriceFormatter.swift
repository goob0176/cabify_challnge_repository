//
//  PriceFormatter.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

protocol PriceFormatterType {
    func format(_ price: Float?) -> String?
}

struct PriceFormatter: PriceFormatterType {
    private static let kSpainLocaleId = "gl_ES"
    
    func format(_ price: Float?) -> String? {
        guard let price = price else {
            return nil
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: Self.kSpainLocaleId)
        return numberFormatter.string(from: price as NSNumber)
    }
}
