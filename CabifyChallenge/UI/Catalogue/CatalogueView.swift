//
//  ContentView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 30.01.2023.
//

import SwiftUI

struct CatalogueView<ViewModel: CatalogueScreenType>: View {
    @StateObject
    private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    @ViewBuilder
    var body: some View {
        Group {
            switch viewModel.screenState {
            case .loading:
                AnimatableOpacityContainerView {
                    CatalogueLoadingView()
                }
            case .loadedCatalogue(catalogueModel: let catalogueModel):
                AnimatableOpacityContainerView {
                    CatalogueProductsView(products: catalogueModel.products ?? [])
                }
            case .error(error: let error):
                AnimatableOpacityContainerView {
                    CatalogueErrorView(
                        errorMessage: error.localizedDescription,
                        refreshAction: viewModel.getProducts
                    )
                }
            }
        }
        .onAppear {
            viewModel.getProducts()
        }
    }
}

struct CatalogueViewPreviews: PreviewProvider {
    static var previews: some View {
        CatalogueView(
            viewModel: ViewModelsFactory.catalogueViewModel(
                NetworkServiceMock(shouldFail: false)
            )
        )
    }
}
