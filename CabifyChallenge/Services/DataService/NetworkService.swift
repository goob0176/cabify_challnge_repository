//
//  NetworkService.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation
import Combine

struct NetworkService: DataService {
    func request<Output: Decodable>(_ url: String) -> AnyPublisher<Output, NetworkError> where Output : Decodable {
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.invalidUrl)
                .eraseToAnyPublisher()
        }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .timeout(.seconds(10.0), scheduler: DispatchQueue.main, customError: {
                URLError(.timedOut)
            })
            .tryMap({ output in
                guard let httpResponce = output.response as? HTTPURLResponse,
                      httpResponce.statusCode == 200 else {
                    throw NetworkError.serverError
                }
                return output.data
            })
            .decode(type: Output.self, decoder: JSONDecoder())
            .compactMap { $0 }
            .mapError({ error in
                guard let error = error as? NetworkError else {
                    return NetworkError.dataReceivingError(description: error.localizedDescription)
                }
                return error
            })
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
