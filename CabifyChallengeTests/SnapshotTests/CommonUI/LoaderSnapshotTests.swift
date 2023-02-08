//
//  LoaderSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import SnapshotTesting
import SwiftUI
import XCTest

@testable import CabifyChallenge

class LoaderSnapshotTests: XCTestCase, Snapshotable {
    func testLoader() {
        let loadingView = UIHostingController(
            rootView: LoadingIndicator(
                color: .blue,
                isLoading: false
            )
        )
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(
            matching: loadingView,
            as: .image(size: loadingView.view.intrinsicContentSize)
        )
    }
}
