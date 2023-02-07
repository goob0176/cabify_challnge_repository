//
//  CatalogueScreenViewModelTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import XCTest
import Combine
@testable import CabifyChallenge

final class CatalogueScreenViewModelTest: XCTestCase {
    func testViewModelIsInLoadingState() {
        let sut = CatalogueScreenViewModel(dataService: NetworkServiceMock(shouldFail: false))
        
        switch sut.screenState {
        case .loading:
            break
        case .error, .loadedCatalogue:
            XCTFail("View model should be in loading state!")
        }
    }
    
    func testSuccessfullModelReceiving() {
        let sut = CatalogueScreenViewModel(dataService: NetworkServiceMock(shouldFail: false))
        sut.getProducts()
                
        switch sut.screenState {
        case .loadedCatalogue(let catalogueModel):
            XCTAssertEqual(catalogueModel, CatalogueModel(products: MocksFactory.models()))
        default:
            XCTFail("Catalogue model should be loaded!")
        }
    }
    
    func testErrorHandling() {
        let sut = CatalogueScreenViewModel(dataService: NetworkServiceMock(shouldFail: true))
        sut.getProducts()
                
        switch sut.screenState {
        case .error(let networkError):
            XCTAssertEqual(networkError, NetworkError.invalidUrl)
        default:
            XCTFail("Networ error must be thrown!")
        }
    }
}
