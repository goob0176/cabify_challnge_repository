//
//  CabifyChallengeTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 30.01.2023.
//

import XCTest
@testable import CabifyChallenge

final class ProductModelTest: XCTestCase {
    func testModelBasicInitialization() {
        let product = ProductModel(
            code: "MUG",
            name: "Cabify Coffee Mug",
            price: 7.5
        )
        
        assertPropertiesAreNotNil(product)
        
        XCTAssertEqual(product.code, "MUG")
        XCTAssertEqual(product.name, "Cabify Coffee Mug")
        XCTAssertEqual(product.price, 7.5)
    }
    
    func testModelCorrectDecoding() {
        let sampleJson =
        """
        {
            "code" : "TSHIRT",
            "name" : "Cabify T-Shirt",
            "price" : 20,
        }
        """
        
        let data = sampleJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        do {
            let product = try decoder.decode(ProductModel.self, from: data)
            
            assertPropertiesAreNotNil(product)
            
            XCTAssertEqual(product.code, "TSHIRT")
            XCTAssertEqual(product.name, "Cabify T-Shirt")
            XCTAssertEqual(product.price, 20)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    private func assertPropertiesAreNotNil(_ product: ProductModel) {
        XCTAssertNotNil(product.code)
        XCTAssertNotNil(product.name)
        XCTAssertNotNil(product.price)
    }
}
