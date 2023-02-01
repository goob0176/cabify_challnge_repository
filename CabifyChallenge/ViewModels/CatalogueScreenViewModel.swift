//
//  CatalogueScreenViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation
import Combine

class CatalogueScreenViewModel: CatalogueScreenType, ObservableObject {
    private let dataService: DataService
    private var cancellables = Set<AnyCancellable>()
    
    private var cataloguePublisger: AnyPublisher<CatalogueModel, NetworkError> {
        dataService.request("")
    }
    
    @Published
    var screenState: CatalogueScreenState = .loading
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getProducts() {
        cataloguePublisger
            .sink { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.screenState = .error(error: error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] catalogueModel in
                self?.screenState = .loadedCatalogue(catalogueModel: catalogueModel)
            }
            .store(in: &cancellables)
    }
}
