//
//  CatalogueProductsView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import SwiftUI

// MARK: - Constants

private struct Constants {
    static let topOffsetSpacerHeight = 16.0
    static let bottomOffsetSpacerHeight = 100.0
}

// MARK: - View

struct CatalogueProductsView<ViewModel: CatalogueProductsScreenType>: View {
    @StateObject
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    Spacer()
                        .frame(height: Constants.topOffsetSpacerHeight)
                    VStack(alignment: .leading) {
                        ForEach(viewModel.products) { item in
                            ProductRow(
                                viewModel: ViewModelsFactory.productRow(
                                    product: item,
                                    onCartItemUpdated: { cartItem in
                                        withAnimation {
                                            viewModel.updateCart(with: cartItem)
                                        }
                                    }
                                )
                            )
                        }
                        Spacer()
                            .frame(height: Constants.bottomOffsetSpacerHeight)
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .navigationTitle(Localization.catalogueProductsTitle)
                if let checkoutItem = viewModel.checkoutItem,
                   checkoutItem.totalItems != 0 {
                    VStack {
                        Spacer()
                        CheckoutView(
                            viewModel: ViewModelsFactory.checkout(
                                checkoutItem,
                                onPurchase: {
                                    viewModel.showPurchaseCompletedScreen = true
                                }
                            )
                        )
                    }
                    .padding(.bottom)
                    .transition(
                        .asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: .move(edge: .trailing)
                        )
                    )
                }
                
            }
            .fullScreenCover(
                isPresented: $viewModel.showPurchaseCompletedScreen
            ) {
                OrderCompletedView(
                    viewModel: ViewModelsFactory.orderCompleted(viewModel.orderCodes),
                    isActive: $viewModel.showPurchaseCompletedScreen
                )
            }
        }
    }
}

// MARK: - Previews

struct CatalogueProductsView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogueProductsView(
            viewModel: CatalogueProductsScreenViewModel(
                products: MocksFactory.models()
            )
        )
    }
}
