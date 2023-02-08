//
//  OrderCompletedScreenSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 08.02.2023.
//

import SwiftUI
import XCTest
import SnapshotTesting

@testable import CabifyChallenge

final class OrderCompletedScreenSnapshotTests: XCTestCase, Snapshotable {
    func testViewWithAllProducts() {
        let orderCompletedView = UIHostingController(
            rootView: OrderCompletedView(
                viewModel: OrderCompletedViewModel(
                    productCodes: ["VOUCHER", "TSHIRT", "MUG"]
                ),
                isActive: .constant(true)
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone8)
        )
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone13)
        )
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone13ProMax)
        )
    }
    
    func testViewWithTwoProducts() {
        let orderCompletedView = UIHostingController(
            rootView: OrderCompletedView(
                viewModel: OrderCompletedViewModel(
                    productCodes: ["VOUCHER", "TSHIRT"]
                ),
                isActive: .constant(true)
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone8)
        )
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone13)
        )
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone13ProMax)
        )
    }
    
    func testViewWithOneProduct() {
        let orderCompletedView = UIHostingController(
            rootView: OrderCompletedView(
                viewModel: OrderCompletedViewModel(
                    productCodes: ["VOUCHER"]
                ),
                isActive: .constant(true)
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone8)
        )
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone13)
        )
        assertSnapshot(
            matching: orderCompletedView,
            as: .image(on: .iPhone13ProMax)
        )
    }
}
