//
//  CatalogueProductsViewUITests.swift
//  CabifyChallengeUITests
//
//  Created by Andrey Khlopotin on 30.01.2023.
//

import XCTest

final class CatalogueProductsViewUITests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
    }
    
    func testCheckoutViewAppearsWhenAddingItemToCart() throws {
        let app = XCUIApplication()
        app.launch()
        
        let voucherRowAddToCartButton = app.scrollViews
            .otherElements
            .containing(.staticText, identifier:"Buy two - get one for free!")
            .children(matching: .button)
            .matching(identifier: "Add to cart")
            .element(boundBy: 0)
        
        voucherRowAddToCartButton.tap()
                
        let checkoutViewTitle = app.staticTexts["Items purchased: 1"]
        let checkoutPriceTitle = app.staticTexts["Your price:"]
        let purchaseButton = app.buttons["Purchase"]
        
        XCTAssertTrue(checkoutViewTitle.exists)
        XCTAssertTrue(checkoutPriceTitle.exists)
        XCTAssertTrue(purchaseButton.exists)
    }
    
    func testDiscountLabelsAppearsWhenMultipleVouchersAdded() throws {
        let app = XCUIApplication()
        app.launch()
        
        let voucherRowAddToCartButton = app.scrollViews
            .otherElements
            .containing(.staticText, identifier:"Buy two - get one for free!")
            .children(matching: .button)
            .matching(identifier: "Add to cart")
            .element(boundBy: 0)
        
        voucherRowAddToCartButton.tap(withNumberOfTaps: 3, numberOfTouches: 1)
                
        let checkoutViewTitle = app.staticTexts["Items purchased: 3"]
        let newPriceTitle = app.staticTexts["New price:"]
        let oldPriceTitle = app.staticTexts["Old price:"]
        let youSaveTitle = app.staticTexts["You save:"]
        let purchaseButton = app.buttons["Purchase"]
        
        XCTAssertTrue(checkoutViewTitle.exists)
        XCTAssertTrue(newPriceTitle.exists)
        XCTAssertTrue(oldPriceTitle.exists)
        XCTAssertTrue(youSaveTitle.exists)
        XCTAssertTrue(purchaseButton.exists)
    }
    
    func testOrderCompletedViewAppearsAfterPurchaseButtonTapped() throws {
        let app = XCUIApplication()
        app.launch()
        
        let voucherRowAddToCartButton = app.scrollViews
            .otherElements
            .containing(.staticText, identifier:"Buy two - get one for free!")
            .children(matching: .button)
            .matching(identifier: "Add to cart")
            .element(boundBy: 0)
        
        voucherRowAddToCartButton.tap()
        let purchaseButton = app.buttons["Purchase"]
        purchaseButton.tap()
        
        let orderCompletedTitle = app.staticTexts["Your products are on the way:"]
        
        XCTAssertTrue(orderCompletedTitle.exists)
    }
}

