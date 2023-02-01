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
    let price: Float?
}
