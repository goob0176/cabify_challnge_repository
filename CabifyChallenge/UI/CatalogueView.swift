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
        switch viewModel.screenState {
        case .loading:
            CatalogueLoadingView()
                .onAppear {
                    viewModel.getProducts()
                }
        case .loadedCatalogue(catalogueModel: let catalogueModel):
            Text(catalogueModel.products?.first?.name ?? "")
        case .error(error: let error):
            CatalogueErrorView(
                errorMessage: error.localizedDescription,
                refreshAction: viewModel.getProducts
            )
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
