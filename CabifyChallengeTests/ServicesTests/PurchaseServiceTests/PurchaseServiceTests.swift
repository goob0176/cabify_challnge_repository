//
//  PurchaseServiceTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import XCTest
@testable import CabifyChallenge

// MARK: - Mocks

private struct Mocks {
    static let voucher = ProductModel(code: "VOUCHER", name: "Cabify Voucher", price: 5)
    static let tShirt = ProductModel(code: "TSHIRT", name: "Cabify T-Shirt", price: 20)
    static let mug = ProductModel(code: "MUG", name: "Cabify Coffee Mug", price: 7.5)
}

// MARK: - Tests

final class PurchaseServiceTests: XCTestCase {
    func testBasicPriceCalculations() {
        let purchaseService: PurchasesServiceType = PurchasesService()
        
        purchaseService.add(Mocks.voucher)
        purchaseService.add(Mocks.tShirt)
        purchaseService.add(Mocks.mug)
        
        XCTAssertEqual(purchaseService.store, [Mocks.voucher, Mocks.tShirt, Mocks.mug])
        XCTAssertEqual(purchaseService.totalPrice, 32.5)
    }
    
    func testPriceWhenInsertingAndRemovingItems() {
        let purchaseService: PurchasesServiceType = PurchasesService()
        
        purchaseService.add(Mocks.voucher)
        purchaseService.add(Mocks.tShirt)
        purchaseService.add(Mocks.mug)
        
        purchaseService.remove(Mocks.tShirt)
        
        XCTAssertEqual(purchaseService.store, [Mocks.voucher, Mocks.mug])
        XCTAssertEqual(purchaseService.totalPrice, 12.5)
    }
    
    func testPriceWhenWithMultipleInstancesOfTheSameProductAddedAndRemoved() {
        let purchaseService: PurchasesServiceType = PurchasesService()
        
        purchaseService.add(Mocks.voucher)
        purchaseService.add(Mocks.voucher)
        purchaseService.add(Mocks.tShirt)
        purchaseService.add(Mocks.tShirt)
        purchaseService.add(Mocks.mug)
        purchaseService.add(Mocks.mug)
        
        purchaseService.remove(Mocks.tShirt)
        purchaseService.remove(Mocks.mug)
        
        XCTAssertEqual(purchaseService.store, [Mocks.voucher, Mocks.voucher, Mocks.tShirt, Mocks.mug])
        XCTAssertEqual(purchaseService.totalPrice, 37.5)
    }
}
