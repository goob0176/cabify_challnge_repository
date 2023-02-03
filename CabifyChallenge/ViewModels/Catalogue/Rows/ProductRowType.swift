//
//  ProductRowType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation

protocol ProductRowType {
    var code: String? { get }
    var name: String? { get }
    var price: String? { get }
    
    static func from(_ product: ProductModel) -> Self
}
