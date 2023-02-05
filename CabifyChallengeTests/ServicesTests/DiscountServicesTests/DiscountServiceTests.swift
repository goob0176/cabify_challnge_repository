//
//  DiscountServiceTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class DiscountServiceTests: XCTestCase {
    func testVoucherDiscounts() {
        let voucherDiscountService = DiscountService(type: .voucher)
        
        let voucherResult0 = voucherDiscountService.applyDiscountIfNeeded(productsPurchased: 0)
        let voucherResult1 = voucherDiscountService.applyDiscountIfNeeded(productsPurchased: 1)
        let voucherResult2 = voucherDiscountService.applyDiscountIfNeeded(productsPurchased: 2)
        let voucherResult3 = voucherDiscountService.applyDiscountIfNeeded(productsPurchased: 3)
        let voucherResult4 = voucherDiscountService.applyDiscountIfNeeded(productsPurchased: 4)
        let voucherResult5 = voucherDiscountService.applyDiscountIfNeeded(productsPurchased: 5)
        
        XCTAssertEqual(voucherResult0, .noDiscount)
        XCTAssertEqual(voucherResult1, .noDiscount)
        XCTAssertEqual(voucherResult2, .voucherDiscount(freeUnits: 1))
        XCTAssertEqual(voucherResult3, .voucherDiscount(freeUnits: 1))
        XCTAssertEqual(voucherResult4, .voucherDiscount(freeUnits: 2))
        XCTAssertEqual(voucherResult5, .voucherDiscount(freeUnits: 2))
    }
    
    func testTshirsDiscounts() {
        let tShirtDiscountService = DiscountService(type: .tShirt)
        
        let zeroTshirtsResult = tShirtDiscountService.applyDiscountIfNeeded(productsPurchased: 0)
        let tShirtNonDiscountableResult = tShirtDiscountService.applyDiscountIfNeeded(productsPurchased: 2)
        let tShirtDiscountableResult = tShirtDiscountService.applyDiscountIfNeeded(productsPurchased: 3)
        
        XCTAssertEqual(zeroTshirtsResult, .noDiscount)
        XCTAssertEqual(tShirtNonDiscountableResult, .noDiscount)
        XCTAssertEqual(tShirtDiscountableResult, .tShirtDiscount(newPrice: 19.0))
    }
    
    func testInvalidDiscountTypes() {
        let tShirtDiscountService = DiscountService(type: DiscountType(rawValue: ""))
        
        let result = tShirtDiscountService.applyDiscountIfNeeded(productsPurchased: 3)
        XCTAssertEqual(result, .noDiscount)
    }
}
