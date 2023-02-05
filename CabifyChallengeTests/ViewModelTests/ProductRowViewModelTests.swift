//
//  ProductRowViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class ProductRowViewModelTests: XCTestCase {
    var voucherModel: (any ProductRowType)!
    var tShirtModel: (any ProductRowType)!
    var mugModel: (any ProductRowType)!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
         voucherModel = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[0])
         tShirtModel = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[1])
         mugModel = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[2])
    }
    
    func testViewModelDefaultInitializer() {
        XCTAssertEqual(voucherModel.title, "Cabify Voucher")
        XCTAssertEqual(voucherModel.formattedPrice, "5,00 €")
        XCTAssertEqual(voucherModel.totalProducts, 0)
        XCTAssertEqual(voucherModel.itemsInCartMessage, "Items in cart: 0")
        XCTAssertNotNil(voucherModel.discountTitle)
        XCTAssertEqual(voucherModel.discountTitle, "Buy two - get one for free!")
        XCTAssertNil(voucherModel.discountPrice)
        XCTAssertNil(voucherModel.freeUnitsMessage)
        
        XCTAssertEqual(tShirtModel.title, "Cabify T-Shirt")
        XCTAssertEqual(tShirtModel.formattedPrice, "20,00 €")
        XCTAssertEqual(tShirtModel.totalProducts, 0)
        XCTAssertEqual(tShirtModel.itemsInCartMessage, "Items in cart: 0")
        XCTAssertNotNil(tShirtModel.discountTitle)
        XCTAssertEqual(tShirtModel.discountTitle, "Buy 3 or more - get each for 19.00€ !")
        XCTAssertNil(tShirtModel.discountPrice)
        XCTAssertNil(tShirtModel.freeUnitsMessage)
        
        XCTAssertEqual(mugModel.title, "Cabify Coffee Mug")
        XCTAssertEqual(mugModel.formattedPrice, "7,50 €")
        XCTAssertEqual(mugModel.totalProducts, 0)
        XCTAssertEqual(mugModel.itemsInCartMessage, "Items in cart: 0")
        XCTAssertNil(mugModel.discountTitle)
        XCTAssertNil(mugModel.discountPrice)
        XCTAssertNil(mugModel.freeUnitsMessage)
    }
    
    func testVoucherViewModelDiscountApplications() {
        voucherModel.updateProducts(2)
        XCTAssertNil(voucherModel.discountPrice)
        XCTAssertNotNil(voucherModel.freeUnitsMessage)
        XCTAssertEqual(voucherModel.freeUnitsMessage, "Free vouchers: 1")
        
        voucherModel.updateProducts(1)
        XCTAssertNil(voucherModel.discountPrice)
        XCTAssertNil(voucherModel.freeUnitsMessage)
        
        voucherModel.updateProducts(6)
        XCTAssertNil(voucherModel.discountPrice)
        XCTAssertNotNil(voucherModel.freeUnitsMessage)
        XCTAssertEqual(voucherModel.freeUnitsMessage, "Free vouchers: 3")
        
        voucherModel.updateProducts(0)
        XCTAssertNil(voucherModel.discountPrice)
        XCTAssertNil(voucherModel.freeUnitsMessage)
    }
    
    func testTshirtViewModelDiscountApplications() {
        tShirtModel.updateProducts(2)
        XCTAssertNil(tShirtModel.freeUnitsMessage)
        XCTAssertNil(tShirtModel.discountPrice)
        
        tShirtModel.updateProducts(3)
        XCTAssertNil(tShirtModel.freeUnitsMessage)
        XCTAssertNotNil(tShirtModel.discountPrice)
        XCTAssertEqual(tShirtModel.discountPrice, "19,00 €")
        
        tShirtModel.updateProducts(6)
        XCTAssertNil(tShirtModel.freeUnitsMessage)
        XCTAssertNotNil(tShirtModel.discountPrice)
        XCTAssertEqual(tShirtModel.discountPrice, "19,00 €")
        
        tShirtModel.updateProducts(0)
        XCTAssertNil(tShirtModel.freeUnitsMessage)
        XCTAssertNil(tShirtModel.discountPrice)
        XCTAssertNil(tShirtModel.discountPrice)
    }
    
    func testNumberOfItemsAndItemsInCartDescription() {
        voucherModel.updateProducts(6)
        tShirtModel.updateProducts(1)
        mugModel.updateProducts(4)
        
        XCTAssertEqual(voucherModel.totalProducts, 6)
        XCTAssertEqual(voucherModel.itemsInCartMessage, "Items in cart: 6")
        
        XCTAssertEqual(tShirtModel.totalProducts, 1)
        XCTAssertEqual(tShirtModel.itemsInCartMessage, "Items in cart: 1")
        
        XCTAssertEqual(mugModel.totalProducts, 4)
        XCTAssertEqual(mugModel.itemsInCartMessage, "Items in cart: 4")
    }
    
    func testMugViewModelDiscountApplications() {
        mugModel.updateProducts(4)
        XCTAssertNil(mugModel.freeUnitsMessage)
        XCTAssertNil(mugModel.discountPrice)
    }
    
    override func tearDownWithError() throws {
        voucherModel = nil
        tShirtModel = nil
        mugModel = nil
        try super.tearDownWithError()
    }
}
