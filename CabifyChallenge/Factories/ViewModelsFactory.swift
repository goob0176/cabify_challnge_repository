//
//  ViewModelsFactory.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import Foundation
import SwiftUI

struct ViewModelsFactory {
    static func catalogueViewModel(_ networkService: DataService = NetworkService()) -> some CatalogueScreenType {
        CatalogueScreenViewModel(dataService: networkService)
    }
}
