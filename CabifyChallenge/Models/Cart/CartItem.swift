//
//  CartItem.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 06.02.2023.
//

import Foundation

struct CartItem: Equatable {
    let code: String
    let totalProducts: Int
    let regularPrice: Float
    let overallDiscount: Float
}
