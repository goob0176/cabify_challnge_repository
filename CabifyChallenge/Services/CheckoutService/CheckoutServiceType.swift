//
//  CheckoutServiceType.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation

protocol CheckoutServiceType {
    func checkout(_ cart: [CartItem]) -> CheckoutItem
}
