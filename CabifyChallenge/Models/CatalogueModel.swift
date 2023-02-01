//
//  CatalogueModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation

struct CatalogueModel: Decodable, Equatable {
    let products: [ProductModel]?
}
