//
//  OrderCompletedViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class OrderCompletedViewModelTests: XCTestCase {
    func testEmojiString() {
        let viewModelThreeCodes = ViewModelsFactory.orderCompleted([
            "VOUCHER", "TSHIRT", "MUG"
        ])
        let viewModelTwoCodes = ViewModelsFactory.orderCompleted([
            "VOUCHER", "MUG"
        ])
        let oneCode = ViewModelsFactory.orderCompleted([
            "VOUCHER"
        ])
        XCTAssertEqual(viewModelThreeCodes.productsEmojis, "🎫👚☕️")
        XCTAssertEqual(viewModelTwoCodes.productsEmojis, "🎫☕️")
        XCTAssertEqual(oneCode.productsEmojis, "🎫")
    }
}
