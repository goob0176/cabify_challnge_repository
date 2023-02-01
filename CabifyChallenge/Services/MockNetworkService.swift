//
//  MockNetworkService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import Foundation
import Combine

// MARK: - Constants

fileprivate struct MockConstants {
    static let catalogueModel = CatalogueModel(products: [
        ProductModel(code: "VOUCHER", name: "Cabify Voucher", price: 5),
        ProductModel(code: "TSHIRT", name: "Cabify T-Shirt", price: 20),
        ProductModel(code: "MUG", name: "Cabify Coffee Mug", price: 7.5),
    ])
}

// MARK: - Implementation

final class NetworkServiceMock: DataService {
    private var shouldFail: Bool
    
    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }
    
    func request<Output>(_ url: String) -> AnyPublisher<Output, CabifyChallenge.NetworkError> where Output : Decodable {
         Just(MockConstants.catalogueModel)
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
