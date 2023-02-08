//
//  Snapshotable.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import Foundation
import XCTest

private let kAssertDescription = "Snapshot must be recorded and checked on @3x simulator! (For example iPhone 13/14) Please select it in simulators list and try again"

protocol Snapshotable {
    func assertIfCurrentSimulatorIs3x()
}

extension Snapshotable {
    func assertIfCurrentSimulatorIs3x() {
        XCTAssertEqual(UIScreen.main.scale, 3, kAssertDescription)
    }
}
