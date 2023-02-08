//
//  CartControl.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation
import SwiftUI

// MARK: Constants

private struct Constants {
    struct CartControl {
        static let generalSpacing = 16.0
        static let overallCornerRadius = 18.5
    }
    struct ControlButton {
        static let font: Font = .system(size: 16.0, weight: .bold)
        static let textPadding = 8.0
        static let imageSide = 35.0
    }
}

// MARK: Helper Types

typealias QuantityChangedAction = (Int)->()

private enum ControlButtonType: String {
    case plus
    case minus
    case addToCart
}

// MARK: Control View

struct CartControl: View {
    @Binding
    private var overallQuantity: Int
    private let onQuantityChaned: QuantityChangedAction
    
    init(
        overallQuantity: Binding<Int>,
        onQuantityChaned: @escaping QuantityChangedAction
    ) {
        _overallQuantity = overallQuantity
        self.onQuantityChaned = onQuantityChaned
    }
    
    var body: some View {
        HStack(spacing: Constants.CartControl.generalSpacing) {
            if overallQuantity > 0 {
                ControlButton(
                    type: .minus,
                    action: {
                        guard overallQuantity > 0 else {
                            return
                        }
                        overallQuantity -= 1
                        onQuantityChaned(overallQuantity)
                    }
                )
                .allowsHitTesting(overallQuantity > 0)
            }
            ControlButton(
                type: overallQuantity > 0 ? .plus : .addToCart,
                action: {
                    overallQuantity += 1
                    onQuantityChaned(overallQuantity)
                }
            )
        }
        .background(Color.primaryColor)
        .cornerRadius(Constants.CartControl.overallCornerRadius)
    }
}

// MARK: Helper Views

private struct ControlButton: View {
    private let type: ControlButtonType
    private let action: ()->Void
    
    init(
        type: ControlButtonType,
        action: @escaping ()->Void
    ) {
        self.type = type
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            if type == .addToCart {
                Text(Localization.addToCartButtonTitle)
                    .padding(Constants.ControlButton.textPadding)
                    .foregroundColor(.white)
                    .font(Constants.ControlButton.font)
            } else {
                Image(systemName: type.rawValue)
                    .foregroundColor(.white)
                    .font(Constants.ControlButton.font)
                    .frame(
                        width: Constants.ControlButton.imageSide,
                        height: Constants.ControlButton.imageSide
                    )
                    .background(Color.primaryColor)
                    .clipShape(Circle())
            }
        }
        
    }
}

// MARK: Previews

struct PriceControlButtonPreviews: PreviewProvider {
    static var previews: some View {
        CartControl(
            overallQuantity: .constant(2),
            onQuantityChaned: {_ in}
        )
    }
}
