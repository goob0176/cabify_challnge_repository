//
//  NetworkError.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation

enum NetworkError: Equatable {
    case invalidUrl
    case dataReceivingError(description: String)
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return Localization.invalidUrlErrorMsg
        case .dataReceivingError(let description):
            return description
        }
    }
}
