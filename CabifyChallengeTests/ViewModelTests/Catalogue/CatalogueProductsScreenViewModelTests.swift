//
//  CatalogueProductsScreenViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class CatalogueProductsScreenViewModelTests: XCTestCase {
    var sut: (any CatalogueProductsScreenType)!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CatalogueProductsScreenViewModel(
            products: MocksFactory.models()
        )
    }
    
    func testDefaultState() {
        XCTAssertNil(sut.checkoutItem)
        XCTAssertEqual(sut.products, MocksFactory.models())
    }
    
    func testCartUpdates() {
        let voucherCartItem = CartItem(
            code: "VOUCHER",
            totalProducts: 3,
            regularPrice: 15.0,
            overallDiscount: 5.0
        )
        
        let tShirtCartItem = CartItem(
            code: "TSHIRT",
            totalProducts: 3,
            regularPrice: 60.0,
            overallDiscount: 3.0
        )
        
        let mugCartItem = CartItem(
            code: "MUG",
            totalProducts: 3,
            regularPrice: 22.5,
            overallDiscount: 0.0
        )
        
        sut.updateCart(with: voucherCartItem)
        sut.updateCart(with: tShirtCartItem)
        sut.updateCart(with: mugCartItem)

        XCTAssertNotNil(sut.checkoutItem)
        
        XCTAssertEqual(sut.checkoutItem?.totalItems, 9)
        XCTAssertEqual(sut.checkoutItem?.totalPrice, 97.5)
        XCTAssertEqual(sut.checkoutItem?.totalDiscount, 8.0)
        XCTAssertEqual(sut.orderCodes, ["VOUCHER", "TSHIRT", "MUG"])
    }
}
