//
//  CheckoutViewSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 08.02.2023.
//

import SwiftUI
import XCTest
import SnapshotTesting

@testable import CabifyChallenge

final class CheckoutViewSnapshotTests: XCTestCase, Snapshotable {
    func testCheckoutViewNoDiscountState() {
        let checkoutView = UIHostingController(
            rootView: CheckoutView(
                viewModel: CheckoutViewModel(
                    checkoutItem: CheckoutItem(
                        totalItems: 3,
                        totalPrice: 15.0,
                        totalDiscount: 0.0
                    )
                )
            )
            .frame(width: 350.0)
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: checkoutView,
            as: .image(size: checkoutView.view.intrinsicContentSize)
        )
    }
    
    func testCheckoutViewWithDiscountState() {
        let checkoutView = UIHostingController(
            rootView: CheckoutView(
                viewModel: CheckoutViewModel(
                    checkoutItem: CheckoutItem(
                        totalItems: 3,
                        totalPrice: 15.0,
                        totalDiscount: 5.0
                    )
                )
            )
            .frame(width: 350.0)
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: checkoutView,
            as: .image(size: checkoutView.view.intrinsicContentSize)
        )
    }
}
