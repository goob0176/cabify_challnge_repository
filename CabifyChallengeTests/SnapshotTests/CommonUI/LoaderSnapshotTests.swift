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

class LoaderSnapshotTests: XCTestCase {
    func testLoader() {
        let loadingView =  UIHostingController(
            rootView: LoadingIndicator(
                color: .blue,
                isLoading: false
            )
        )
        assertSnapshot(
            matching: loadingView,
            as: .image(on: .iPhone8, size: loadingView.view.intrinsicContentSize)
        )
    }
}
