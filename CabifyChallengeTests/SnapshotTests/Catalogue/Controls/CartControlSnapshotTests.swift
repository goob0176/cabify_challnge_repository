//
//  CartControlSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import SnapshotTesting
import SwiftUI
import XCTest

@testable import CabifyChallenge

final class CartControlSnapshotTests: XCTestCase {
    func testCartControlWithZeroItems() {
        let priceControl =  UIHostingController(
            rootView: CartControl(overallQuantity: .constant(0), onQuantityChaned: {_ in})
        )
        assertSnapshot(
            matching: priceControl,
            as: .image(on: .iPhone8, size: priceControl.view.intrinsicContentSize)
        )
    }
    
    func testCartControlWithOneItem() {
        let priceControl =  UIHostingController(
            rootView: CartControl(overallQuantity: .constant(1), onQuantityChaned: {_ in})
        )
        assertSnapshot(
            matching: priceControl,
            as: .image(on: .iPhone8, size: priceControl.view.intrinsicContentSize)
        )
    }
}
