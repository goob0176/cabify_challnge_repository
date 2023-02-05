//
//  ProductModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 30.01.2023.
//

import Foundation

struct ProductModel: Decodable, Equatable {
    let code: String?
    let name: String?
    var price: Float?
}

extension ProductModel: Discountable {
    mutating func updatePrice(_ newPrice: Float) {
        price = newPrice
    }
}

extension ProductModel: Identifiable {
    var id: String {
        code ?? UUID().uuidString
    }
}
