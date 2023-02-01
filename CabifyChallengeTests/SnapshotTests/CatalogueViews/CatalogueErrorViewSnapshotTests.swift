//
//  CatalogueErrorViewSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SnapshotTesting
import XCTest

@testable import CabifyChallenge

class CatalogueErrorViewSnapshotTests: XCTestCase {
  func testMyViewController() {
      let errorView = CatalogueErrorView(errorMessage: "Something went wrong", refreshAction: {})

    assertSnapshot(matching: errorView, as: .image)
  }
}
