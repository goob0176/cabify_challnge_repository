//
//  NetworkErrorTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import XCTest
@testable import CabifyChallenge

final class NetworkErrorTests: XCTestCase {
    private static let kDataReceivingErrorDescription = "Data receiving error!"
    
    func testLocalizedDescriptionOfError() {
        let invalidUrlError = NetworkError.invalidUrl
        let serverError = NetworkError.serverError
        let dataReceivingError = NetworkError.dataReceivingError(description: Self.kDataReceivingErrorDescription)
        
        XCTAssertEqual(invalidUrlError.localizedDescription, Localization.invalidUrlErrorMsg)
        XCTAssertEqual(serverError.localizedDescription, Localization.serverErrorMsg)
        XCTAssertEqual(dataReceivingError.localizedDescription, Self.kDataReceivingErrorDescription)
    }
}
