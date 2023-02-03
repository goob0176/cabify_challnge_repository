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
        let viewModelFirst: ProductRowType = ProductRowViewModel(product: MocksFactory.models()[0])
        let viewModelLast: ProductRowType = ProductRowViewModel(product: MocksFactory.models()[2])

        XCTAssertEqual(viewModelFirst.title, "Cabify Voucher")
        XCTAssertEqual(viewModelFirst.formattedPrice, "5,00 €")
        
        XCTAssertEqual(viewModelLast.title, "Cabify Coffee Mug")
        XCTAssertEqual(viewModelLast.formattedPrice, "7,50 €")
    }
}
