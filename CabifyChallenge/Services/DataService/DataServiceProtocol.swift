//
//  DataServiceProtocol.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation
import Combine

protocol DataService {
    func request<Output: Decodable>(_ url: String) -> AnyPublisher<Output, NetworkError>
}
