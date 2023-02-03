//
//  PriceControlSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import SnapshotTesting
import SwiftUI
import XCTest

@testable import CabifyChallenge

final class PriceControlSnapshotTests: XCTestCase {
    func testPriceControlWithZeroItems() {
        let priceControl =  UIHostingController(
            rootView: PriceControl(overallQuantity: .constant(0), onQuantityChaned: {_ in})
        )
        assertSnapshot(
            matching: priceControl,
            as: .image(on: .iPhone8, size: priceControl.view.intrinsicContentSize)
        )
    }
    
    func testPriceControlWithOneItem() {
        let priceControl =  UIHostingController(
            rootView: PriceControl(overallQuantity: .constant(1), onQuantityChaned: {_ in})
        )
        assertSnapshot(
            matching: priceControl,
            as: .image(on: .iPhone8, size: priceControl.view.intrinsicContentSize)
        )
    }
}
