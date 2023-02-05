//
//  CatalogModel.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import XCTest
@testable import CabifyChallenge

final class CatalogueModelTest: XCTestCase {
    func testModelBasicInitialization() {
        let catalogueModel = CatalogueModel(products: [
            ProductModel(
                code: "MUG",
                name: "Cabify Coffee Mug",
                price: 7.5
            ),
            ProductModel(
                code: "TSHIRT",
                name: "Cabify T-Shirt",
                price: 20
            ),
        ])
        
        assertProductsArray(catalogueModel.products)
    }
    
    func testModelCorrectDecoding() {
        let sampleJson =
        """
        {
          "products": [
            {
              "code": "MUG",
              "name": "Cabify Coffee Mug",
              "price": 7.5
            },
            {
              "code": "TSHIRT",
              "name": "Cabify T-Shirt",
              "price": 20
            }
          ]
        }
        """
        
        let data = sampleJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        do {
            let catalogueModel = try decoder.decode(CatalogueModel.self, from: data)
            
            assertProductsArray(catalogueModel.products)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    private func assertProductsArray(_ products: [ProductModel]?) {
        XCTAssertNotNil(products)
        
        XCTAssertEqual(products?.count, 2)
        
        XCTAssertEqual(products?.first?.code, "MUG")
        XCTAssertEqual(products?.first?.name, "Cabify Coffee Mug")
        XCTAssertEqual(products?.first?.price, 7.5)
        
        XCTAssertEqual(products?.last?.code, "TSHIRT")
        XCTAssertEqual(products?.last?.name, "Cabify T-Shirt")
        XCTAssertEqual(products?.last?.price, 20)
    }
}
