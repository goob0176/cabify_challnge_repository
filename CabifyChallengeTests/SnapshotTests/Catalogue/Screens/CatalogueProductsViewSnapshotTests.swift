//
//  CatalogueProductsViewSnapshotTests.swift
//  CabifyChallengeTests
//
//  Created by Andrey Khlopotin on 08.02.2023.
//

import SwiftUI
import XCTest
import SnapshotTesting

@testable import CabifyChallenge

final class CatalogueProductsViewSnapshotTests: XCTestCase, Snapshotable {
    func testScreenNoProductsInCartState() {
        let productsView = UIHostingController(
            rootView: CatalogueProductsView(
                viewModel: viewModel()
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(matching: productsView, as: .image(on: .iPhone8))
        assertSnapshot(matching: productsView, as: .image(on: .iPhone13))
        assertSnapshot(matching: productsView, as: .image(on: .iPhone13ProMax))
    }
    
    func testProductsWithoutDiscountsCartState() {
        let viewModel = viewModel()
        let productsView = UIHostingController(
            rootView: CatalogueProductsView(
                viewModel: viewModel
            )
        )
        
        viewModel.updateCart(
            with: CartItem(
                code: "MUG",
                totalProducts: 1,
                regularPrice: 7.5,
                overallDiscount: 0.0
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(matching: productsView, as: .image(on: .iPhone8))
        assertSnapshot(matching: productsView, as: .image(on: .iPhone13))
        assertSnapshot(matching: productsView, as: .image(on: .iPhone13ProMax))
    }
    
    func testDiscountState() {
        let viewModel = viewModel()
        let productsView = UIHostingController(
            rootView: CatalogueProductsView(
                viewModel: viewModel
            )
        )
        
        viewModel.updateCart(
            with: CartItem(
                code: "VOUCHER",
                totalProducts: 3,
                regularPrice: 15.0,
                overallDiscount: 5.0
            )
        )
        
        assertIfCurrentSimulatorIs3x()
        assertSnapshot(matching: productsView, as: .image(on: .iPhone8))
        assertSnapshot(matching: productsView, as: .image(on: .iPhone13))
        assertSnapshot(matching: productsView, as: .image(on: .iPhone13ProMax))
    }

    private func viewModel() -> some CatalogueProductsScreenType {
        CatalogueProductsScreenViewModel(
            products: MocksFactory.models()
        )
    }
}
