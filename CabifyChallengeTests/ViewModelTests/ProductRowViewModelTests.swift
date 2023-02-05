//
//  ProductRowViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class ProductRowViewModelTests: XCTestCase {
    func testViewModelDefaultInitializer() {
        let voucherModel: ProductRowType = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[0])
        let mugModel: ProductRowType = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[2])

        XCTAssertEqual(voucherModel.title, "Cabify Voucher")
        XCTAssertEqual(voucherModel.formattedPrice, "5,00 €")
        XCTAssertNotNil(voucherModel.discountTitle)
        XCTAssertEqual(voucherModel.discountTitle, "Buy two - get one for free!")
        
        XCTAssertEqual(mugModel.title, "Cabify Coffee Mug")
        XCTAssertEqual(mugModel.formattedPrice, "7,50 €")
        XCTAssertNil(mugModel.discountTitle)
    }
}
