//
//  DiscountTypeTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 04.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class DiscountTypeTests: XCTestCase {
    func testDiscountTypeDescription() {
        let voucherDiscount = DiscountType.voucher
        let tShirtDiscount = DiscountType.tShirt
        
        XCTAssertEqual(voucherDiscount.discountTitle, "Buy two - get one for free!")
        XCTAssertEqual(tShirtDiscount.discountTitle, "Buy 3 or more - get each for 19.00€ !")
    }
    
    func testDiscountRawValueInitialization() {
        let tVoucherModel = MocksFactory.models()[0]
        let tShirtModel = MocksFactory.models()[1]
        let mugModel = MocksFactory.models()[2]
        
        let voucherDiscount = DiscountType(rawValue: tVoucherModel.code!)
        let tShirtDiscount = DiscountType(rawValue: tShirtModel.code!)
        let mugDiscount = DiscountType(rawValue: mugModel.code!)
        
        XCTAssertNil(mugDiscount)
        
        XCTAssertNotNil(voucherDiscount)
        XCTAssertNotNil(tShirtDiscount)
    
        XCTAssertEqual(voucherDiscount!.discountTitle, "Buy two - get one for free!")
        XCTAssertEqual(tShirtDiscount!.discountTitle, "Buy 3 or more - get each for 19.00€ !")
    }
}
