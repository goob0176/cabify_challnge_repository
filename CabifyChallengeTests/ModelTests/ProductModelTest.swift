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
            code: "VOUCHER",
            name: "Cabify Voucher",
            price: 5
        )
        
        XCTAssertNotNil(product.code)
        XCTAssertNotNil(product.name)
        XCTAssertNotNil(product.price)
        
        XCTAssertEqual(product.code, "VOUCHER")
        XCTAssertEqual(product.name, "Cabify Voucher")
        XCTAssertEqual(product.price, 5)
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
            
            XCTAssertNotNil(product.code)
            XCTAssertNotNil(product.name)
            XCTAssertNotNil(product.price)
            
            XCTAssertEqual(product.code, "TSHIRT")
            XCTAssertEqual(product.name, "Cabify T-Shirt")
            XCTAssertEqual(product.price, 20)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
