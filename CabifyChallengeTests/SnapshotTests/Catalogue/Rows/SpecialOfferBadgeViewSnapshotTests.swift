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

final class SpecialOfferBadgeViewSnapshotTests: XCTestCase, Snapshotable {
    func testBadgeViewGeneralState() {
        let generalView =  UIHostingController(
            rootView: SpecialOfferBadgeView(
                width: 200.0,
                title: "Every third - off!"
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: generalView,
            as: .image(size: generalView.view.intrinsicContentSize)
        )
    }
    
    func testBadgeViewScaledTextState() {
        let generalView =  UIHostingController(
            rootView: SpecialOfferBadgeView(
                width: 200.0,
                title: "Every third t-shirt are sold for free!"
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: generalView,
            as: .image(size: generalView.view.intrinsicContentSize)
        )
    }
    
    func testBadgeViewOverflowedTextState() {
        let generalView =  UIHostingController(
            rootView: SpecialOfferBadgeView(
                width: 70.0,
                title: "Every third - off!"
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: generalView,
            as: .image(size: generalView.view.intrinsicContentSize)
        )
    }
}
