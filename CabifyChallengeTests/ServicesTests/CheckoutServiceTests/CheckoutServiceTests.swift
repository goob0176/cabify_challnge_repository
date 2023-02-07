//
//  CheckoutServiceTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import XCTest
@testable import CabifyChallenge

// MARK: - Tests

final class CheckoutServiceTests: XCTestCase {
    var sut: CheckoutServiceType!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CheckoutService()
    }
    
    func testItemsWithNoDiscount() {
        let voucherCartItem = CartItem(
            code: "VOUCHER",
            totalProducts: 1,
            regularPrice: 5.0,
            overallDiscount: 0.0
        )
        
        let tShirtCartItem = CartItem(
            code: "TSHIRT",
            totalProducts: 1,
            regularPrice: 20.0,
            overallDiscount: 0.0
        )
        
        let mugCartItem = CartItem(
            code: "MUG",
            totalProducts: 1,
            regularPrice: 7.5,
            overallDiscount: 0.0
        )
        
        let checkoutItem = sut.checkout([
            voucherCartItem,
            tShirtCartItem,
            mugCartItem
        ])
        
        XCTAssertEqual(checkoutItem.totalItems, 3)
        XCTAssertEqual(checkoutItem.totalPrice, 32.5)
        XCTAssertEqual(checkoutItem.totalDiscount, 0.0)
    }
    
    func testTwoVouchersWithDiscountAndTShirt() {
        let voucherCartItem = CartItem(
            code: "VOUCHER",
            totalProducts: 2,
            regularPrice: 10.0,
            overallDiscount: 5.0
        )
        
        let tShirtCartItem = CartItem(
            code: "TSHIRT",
            totalProducts: 1,
            regularPrice: 20.0,
            overallDiscount: 0.0
        )
        
        let checkoutItem = sut.checkout([
            voucherCartItem,
            tShirtCartItem
        ])
        
        XCTAssertEqual(checkoutItem.totalItems, 3)
        XCTAssertEqual(checkoutItem.totalPrice, 30.0)
        XCTAssertEqual(checkoutItem.totalDiscount, 5.0)
    }
    
    func testFourTshirtsithDiscountAndVoucher() {
        let voucherCartItem = CartItem(
            code: "VOUCHER",
            totalProducts: 1,
            regularPrice: 5.0,
            overallDiscount: 0.0
        )
        
        let tShirtCartItem = CartItem(
            code: "TSHIRT",
            totalProducts: 4,
            regularPrice: 80.0,
            overallDiscount: 4.0
        )
        
        let checkoutItem = sut.checkout([
            voucherCartItem,
            tShirtCartItem
        ])
        
        XCTAssertEqual(checkoutItem.totalItems, 5)
        XCTAssertEqual(checkoutItem.totalPrice, 85.0)
        XCTAssertEqual(checkoutItem.totalDiscount, 4.0)
    }
    
    func testThreeVouchersAndThreeTshirtsWithDiscountAndMug() {
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
            totalProducts: 1,
            regularPrice: 7.5,
            overallDiscount: 0.0
        )
        
        let checkoutItem = sut.checkout([
            voucherCartItem,
            tShirtCartItem,
            mugCartItem
        ])
        
        XCTAssertEqual(checkoutItem.totalItems, 7)
        XCTAssertEqual(checkoutItem.totalPrice, 82.5)
        XCTAssertEqual(checkoutItem.totalDiscount, 8.0)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}
