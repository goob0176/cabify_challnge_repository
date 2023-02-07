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
    
    var onVoucherCartItemUpdated: CartItemResponse?
    var onTshirtCartItemUpdated: CartItemResponse?
    var onMugCartItemUpdated: CartItemResponse?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        voucherModel = MocksFactory.row(.voucher)
        tShirtModel = MocksFactory.row(.tShirt)
        mugModel = MocksFactory.row(.mug)
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
    
    func testProducedCartItems() {
        var voucherCartItem = CartItem.empty()
        var tShirtCartItem = CartItem.empty()
        var mugCartItem = CartItem.empty()
        
        let voucherModel = MocksFactory.row(.voucher) { voucher in
            voucherCartItem = voucher
        }
        
        let tShirtModel = MocksFactory.row(.tShirt) { tShirt in
            tShirtCartItem = tShirt
        }
        
        let mugModel = MocksFactory.row(.mug) { mug in
            mugCartItem = mug
        }
        
        voucherModel.updateProducts(6)
        tShirtModel.updateProducts(4)
        mugModel.updateProducts(5)
        
        XCTAssertEqual(voucherCartItem.totalProducts, 6)
        XCTAssertEqual(voucherCartItem.regularPrice, 30.0)
        XCTAssertEqual(voucherCartItem.overallDiscount, 15.0)
        
        XCTAssertEqual(tShirtCartItem.totalProducts, 4)
        XCTAssertEqual(tShirtCartItem.regularPrice, 80.0)
        XCTAssertEqual(tShirtCartItem.overallDiscount, 4.0)
        
        XCTAssertEqual(mugCartItem.totalProducts, 5)
        XCTAssertEqual(mugCartItem.regularPrice, 37.5)
        XCTAssertEqual(mugCartItem.overallDiscount, 0.0)
    }
    
    override func tearDownWithError() throws {
        voucherModel = nil
        tShirtModel = nil
        mugModel = nil
        try super.tearDownWithError()
    }
}

// MARK: Private helpers

private extension CartItem {
    static func empty() -> Self {
        CartItem(
            code: "",
            totalProducts: 0,
            regularPrice: 0.0,
            overallDiscount: 0.0
        )
    }
}
