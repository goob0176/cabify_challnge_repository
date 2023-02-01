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
        case .loadedCatalogue(catalogueModel: let catalogueModel):
             EmptyView()
        case .error(error: let error):
             EmptyView()
        }
    }
}

struct CatalogueViewPreviews: PreviewProvider {
    static var previews: some View {
        CatalogueView(viewModel: ViewModelsFactory.catalogueViewModel())
    }
}
