//
//  SpecialOfferBadgeViewSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import SwiftUI
import XCTest
import SnapshotTesting

@testable import CabifyChallenge

final class SpecialOfferBadgeViewSnapshotTests: XCTestCase {
    func testBadgeViewGeneralState() {
        let generalView =  UIHostingController(
            rootView: SpecialOfferBadgeView(
                width: 200.0,
                title: "Every third - off!"
            )
        )
        assertSnapshot(
            matching: generalView,
            as: .image(on: .iPhone8, size: generalView.view.intrinsicContentSize)
        )
    }
    
    func testBadgeViewScaledTextState() {
        let generalView =  UIHostingController(
            rootView: SpecialOfferBadgeView(
                width: 200.0,
                title: "Every third t-shirt are sold for free!"
            )
        )
        assertSnapshot(
            matching: generalView,
            as: .image(on: .iPhone8, size: generalView.view.intrinsicContentSize)
        )
    }
    
    func testBadgeViewOverflowedTextState() {
        let generalView =  UIHostingController(
            rootView: SpecialOfferBadgeView(
                width: 70.0,
                title: "Every third - off!"
            )
        )
        assertSnapshot(
            matching: generalView,
            as: .image(on: .iPhone8, size: generalView.view.intrinsicContentSize)
        )
    }
}
