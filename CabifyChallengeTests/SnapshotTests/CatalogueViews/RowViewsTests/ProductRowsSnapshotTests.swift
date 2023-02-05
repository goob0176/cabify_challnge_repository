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
    var voucherModel: ProductRowViewModel!
    var tShirtModel: ProductRowViewModel!
    var mugModel: ProductRowViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        voucherModel = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[0]) as? ProductRowViewModel
        tShirtModel = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[1]) as? ProductRowViewModel
        mugModel = ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[2]) as? ProductRowViewModel
    }
    
    func testRowDefaultState() {
        let mugView =  UIHostingController(
            rootView: ProductRow(viewModel: mugModel)
        )
        
        assertSnapshot(
            matching: mugView,
            as: .image(on: .iPhone13)
        )
    }
    
    func testVoucherDiscountState() {
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
        let tShirtView =  UIHostingController(
            rootView: ProductRow(viewModel: tShirtModel)
        )
        tShirtModel.updateProducts(3)
        assertSnapshot(
            matching: tShirtView,
            as: .image(on: .iPhone13)
        )
    }

    override func tearDownWithError() throws {
        voucherModel = nil
        tShirtModel = nil
        mugModel = nil
        try super.tearDownWithError()
    }
}
