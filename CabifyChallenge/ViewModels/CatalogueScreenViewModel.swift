//
//  CatalogueScreenViewModel.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation
import Combine

fileprivate struct Constants {
    static let baseUrl = "https://gist.githubusercontent.com"
    static let parameters = "palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887"
    static let file = "Products.json"
}

class CatalogueScreenViewModel: CatalogueScreenType, ObservableObject {
    private let dataService: DataService
    private var cancellables = Set<AnyCancellable>()
    
    private var url: String {
        [
            Constants.baseUrl,
            Constants.parameters,
            Constants.file
        ]
            .joined(separator: "/")
    }
    
    private var cataloguePublisger: AnyPublisher<CatalogueModel, NetworkError> {
        dataService.request(url)
    }
    
    @Published
    var screenState: CatalogueScreenState = .loading
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getProducts() {
        screenState = .loading
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
