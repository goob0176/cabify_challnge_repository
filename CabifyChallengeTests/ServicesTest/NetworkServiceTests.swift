//
//  NetworkServiceTest.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import XCTest
import Combine
@testable import CabifyChallenge

// MARK: - Constants

fileprivate struct MockConstants {
    static let url = "https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
    
    static let serverErrorUrl = "https://httpstat.us/500"
    static let systemErrorDescription = "The data couldn’t be read because it isn’t in the correct format."
}

// MARK: - Tests

final class NetworkServiceTest: XCTestCase {
    private var sut: DataService!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = NetworkService()
    }
    
    func testSuccessfullResponce() {
        let publisher: AnyPublisher<CatalogueModel, NetworkError> = sut.request(MockConstants.url)
        var responceModel: CatalogueModel?
        var error: Error?
        
        asyncWait(
            for: publisher,
            onError: { error = $0 },
            onValue: { responceModel = $0 }
        )
        
        XCTAssertNil(error)
        
        XCTAssertNotNil(responceModel)
        XCTAssertNotNil(responceModel?.products)
        XCTAssertEqual(responceModel?.products, MocksFactory.models())
    }
    
    func testResponceFromIvalidUrl() {
        let publisher: AnyPublisher<CatalogueModel, NetworkError> = sut.request("")
        var error: Error?

        asyncWait(for: publisher) { error = $0 }
        
        XCTAssertNotNil(error)
        XCTAssertEqual(error as? NetworkError, NetworkError.invalidUrl)
    }
    
    func testResponceWithServerError() {
        let publisher: AnyPublisher<CatalogueModel, NetworkError> = sut.request(MockConstants.serverErrorUrl)
        var error: Error?

        asyncWait(for: publisher) { error = $0 }
        
        XCTAssertNotNil(error)
        XCTAssertEqual(error as? NetworkError, NetworkError.serverError)
    }
    
    func testResponceWithParsingError() {
        let publisher: AnyPublisher<[String], NetworkError> = sut.request(MockConstants.url)
        var error: Error?
        
        asyncWait(for: publisher) { error = $0 }
        
        XCTAssertNotNil(error)
        XCTAssertEqual(error as? NetworkError, NetworkError.dataReceivingError(description: MockConstants.systemErrorDescription))
    }
        
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}

// MARK: - Helper functions

private extension NetworkServiceTest {
    func asyncWait<T: Decodable>(
        for publisher: AnyPublisher<T, NetworkError>,
        timeout: Double = 20.0,
        onError: ((Error)->Void)? = nil,
        onValue: ((T)-> Void)? = nil
    ) {
        let expectation = expectation(description: "Processing network")
        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let networkError):
                    onError?(networkError)
                case .finished:
                    break
                }
                expectation.fulfill()
            }
        ) { value in
            onValue?(value)
        }
        
        wait(for: [expectation], timeout: timeout)
        cancellable.cancel()
    }
}
