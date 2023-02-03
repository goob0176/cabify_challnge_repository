//
//  MockNetworkService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import Foundation
import Combine

final class NetworkServiceMock: DataService {
    private var shouldFail: Bool
    
    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }
    
    func request<Output>(_ url: String) -> AnyPublisher<Output, CabifyChallenge.NetworkError> where Output : Decodable {
        Just(CatalogueModel(products: MocksFactory.models()))
            .tryMap({ model in
                guard !shouldFail,
                      let output = model as? Output else {
                    throw NetworkError.serverError
                }
                return output
            })
            .mapError { _ in NetworkError.serverError }
            .eraseToAnyPublisher()
    }
}
