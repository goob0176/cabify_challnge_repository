//
//  ProductRowsSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 05.02.2023.
//

import SwiftUI
import XCTest
import SnapshotTesting

@testable import CabifyChallenge

final class ProductRowsSnapshotTests: XCTestCase {
    func testRowDefaultState() {
        let mugView =  UIHostingController(
            rootView: ProductRow(viewModel: MocksFactory.row(.mug))
        )
        
        assertSnapshot(
            matching: mugView,
            as: .image(on: .iPhone13)
        )
    }
    
    func testVoucherDiscountState() {
        let voucherModel = MocksFactory.row(.voucher)
        let voucherView =  UIHostingController(
            rootView: ProductRow(viewModel: voucherModel)
        )
        voucherModel.updateProducts(2)
        assertSnapshot(
            matching: voucherView,
            as: .image(on: .iPhone13)
        )
    }
    
    func testTshirtDiscountState() {
        let tShirtModel = MocksFactory.row(.tShirt)
        let tShirtView =  UIHostingController(
            rootView: ProductRow(viewModel: tShirtModel)
        )
        tShirtModel.updateProducts(3)
        assertSnapshot(
            matching: tShirtView,
            as: .image(on: .iPhone13)
        )
    }
}
