//
//  CatalogueScreenType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 31.01.2023.
//

import Foundation
import Combine

enum CatalogueScreenState {
    case loading
    case loadedCatalogue(catalogueModel: CatalogueModel)
    case error(error: NetworkError)
}

protocol CatalogueScreenType: AnyObject, ObservableObject {
    var screenState: CatalogueScreenState { get set }
    func getProducts()
}
