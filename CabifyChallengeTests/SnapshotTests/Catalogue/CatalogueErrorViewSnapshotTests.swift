//
//  CatalogueErrorViewSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SnapshotTesting
import SwiftUI
import XCTest

@testable import CabifyChallenge

class CatalogueErrorViewSnapshotTests: XCTestCase {
    func testErrorView() {
        let errorView =  UIHostingController(rootView: CatalogueErrorView(errorMessage: "Something went wrong", refreshAction: {}))
        
        assertSnapshot(matching: errorView, as: .image(on: .iPhone8))
        assertSnapshot(matching: errorView, as: .image(on: .iPhone13))
        assertSnapshot(matching: errorView, as: .image(on: .iPhone13ProMax))
    }
    
    func testErrorViewWithLongDescription() {
        let longErrorMessage = """
        We are sorry, the software failed
        to start because it is missing
        some required files. Please
        reinstall the software and it
        should work again. Your data
        and settings have been
        preserved.
        If the issue still presents,
        please contact the technical support,
        we are glad to support you!
        """
        
        let errorView =  UIHostingController(rootView: CatalogueErrorView(errorMessage: longErrorMessage, refreshAction: {}))
        
        assertSnapshot(matching: errorView, as: .image(on: .iPhone8))
        assertSnapshot(matching: errorView, as: .image(on: .iPhone13))
        assertSnapshot(matching: errorView, as: .image(on: .iPhone13ProMax))
    }
}
