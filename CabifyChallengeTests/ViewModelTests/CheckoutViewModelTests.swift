//
//  CheckoutViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class CheckoutViewModelTests: XCTestCase {
    func testViewModelWithoutDiscount() {
        let viewModel = CheckoutViewModel(
            checkoutItem: CheckoutItem(
                totalItems: 3,
                totalPrice: 22.0,
                totalDiscount: 0.0
            )
        )
        
        XCTAssertEqual(viewModel.totalProducts, 3)
        XCTAssertEqual(viewModel.totalPrice, "22,00 €")
        XCTAssertEqual(viewModel.priceWithDiscount, "")
        XCTAssertEqual(viewModel.discountValue, "")
    }
    
    func testViewModelWithDiscount() {
        let viewModel = CheckoutViewModel(
            checkoutItem: CheckoutItem(
                totalItems: 5,
                totalPrice: 89.0,
                totalDiscount: 8.0
            )
        )
        
        XCTAssertEqual(viewModel.totalProducts, 5)
        XCTAssertEqual(viewModel.totalPrice, "89,00 €")
        XCTAssertEqual(viewModel.priceWithDiscount, "81,00 €")
        XCTAssertEqual(viewModel.discountValue, "8,00 €")
    }
}
