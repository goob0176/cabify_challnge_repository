//
//  CatalogueLoadingViewSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import SnapshotTesting
import SwiftUI
import XCTest

@testable import CabifyChallenge


class CatalogueLoadingViewSnapshotTests: XCTestCase, Snapshotable {
    func testCatalogueLoadingView() {
        let loadingView =  UIHostingController(rootView: CatalogueLoadingView(isLoading: false))
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(matching: loadingView, as: .image(on: .iPhone8))
        assertSnapshot(matching: loadingView, as: .image(on: .iPhone13))
        assertSnapshot(matching: loadingView, as: .image(on: .iPhone13ProMax))
    }
}
