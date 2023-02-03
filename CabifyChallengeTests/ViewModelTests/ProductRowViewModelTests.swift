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
        let viewModel: ProductRowType = ProductRowViewModel(
            code: "VOUCHER",
            name: "Cabify Voucher",
            price: "30 €"
        )
        
        XCTAssertEqual(viewModel.code, "VOUCHER")
        XCTAssertEqual(viewModel.name, "Cabify Voucher")
        XCTAssertEqual(viewModel.price, "30 €")
    }
    
    func testViewModelFromProductInitializer() {
        let viewModel: ProductRowType = ProductRowViewModel.from(MocksFactory.models()[0])
        
        XCTAssertEqual(viewModel.code, "VOUCHER")
        XCTAssertEqual(viewModel.name, "Cabify Voucher")
        XCTAssertEqual(viewModel.price, "5 €")
    }
}
