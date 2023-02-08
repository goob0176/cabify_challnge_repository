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

final class ProductRowsSnapshotTests: XCTestCase, Snapshotable {
    func testRowDefaultState() {
        let mugView =  UIHostingController(
            rootView: ProductRow(
                viewModel: MocksFactory.row(.mug)
            )
            .frame(width: 350.0)
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: mugView,
            as: .image(size: mugView.view.intrinsicContentSize)
        )
    }
    
    func testVoucherDiscountState() {
        let voucherModel = MocksFactory.row(.voucher)
        let voucherView =  UIHostingController(
            rootView: ProductRow(
                viewModel: voucherModel
            )
            .frame(width: 350.0)
            .offset(y: 20.0)
        )
        voucherModel.updateProducts(2)
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: voucherView,
            as: .image(size: voucherView.view.intrinsicContentSize)
        )
    }
    
    func testTshirtDiscountState() {
        let tShirtModel = MocksFactory.row(.tShirt)
        let tShirtView =  UIHostingController(
            rootView: ProductRow(
                viewModel: tShirtModel
            )
            .frame(width: 350.0)
            .offset(y: 20.0)
        )
        tShirtModel.updateProducts(3)
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: tShirtView,
            as: .image(size: tShirtView.view.intrinsicContentSize)
        )
    }
}
