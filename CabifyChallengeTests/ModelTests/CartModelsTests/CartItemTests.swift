//
//  CartItemTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 06.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class CartItemTests: XCTestCase {
    func testDefaultInitializer() {
        let cartItem = CartItem(
            code: "TSHIRT",
            totalProducts: 3,
            regularPrice: 20.0,
            overallDiscount: 19.0
        )
        
        XCTAssertEqual(cartItem.code, "TSHIRT")
        XCTAssertEqual(cartItem.totalProducts, 3)
        XCTAssertEqual(cartItem.regularPrice, 20.0)
        XCTAssertEqual(cartItem.overallDiscount, 19.0)
    }
}
