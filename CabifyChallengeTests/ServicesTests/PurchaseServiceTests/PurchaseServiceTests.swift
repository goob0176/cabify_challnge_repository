//
//  PurchaseServiceTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class PurchaseServiceTests: XCTestCase {
    func testBasicPriceCalculations() {
        let purchaseService: PurchasesServiceType = PurchasesService()
        purchaseService.handlePurchases(MocksFactory.models())
        
        XCTAssertEqual(purchaseService.itemsPurchased, MocksFactory.models().count)
        XCTAssertEqual(purchaseService.totalPrice, 32.5)
    }
}
