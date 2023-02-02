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
      assertSnapshot(matching: errorView, as: .image(on: .iPhone8), named: "ErrorView_iPhone8")
      assertSnapshot(matching: errorView, as: .image(on: .iPhone13), named: "ErrorView_iPhone13")
      assertSnapshot(matching: errorView, as: .image(on: .iPhone13ProMax), named: "ErrorView_iPhone13ProMax")
  }
}
