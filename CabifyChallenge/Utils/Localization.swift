//
//  Localization.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation

struct Localization {
    static let invalidUrlErrorMsg = "INVALID_URL_ERROR_MSG".localized
    static let serverErrorMsg = "SERVER_ERROR_MSG".localized
}

private extension String {
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
