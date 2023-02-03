//
//  PriceControl.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import Foundation
import SwiftUI

// MARK: Helper Types

typealias QuantityChangedAction = (Int)->()

private enum ControlButtonType: String {
    case plus
    case minus
}

// MARK: Control View

struct PriceControl: View {
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
        HStack(spacing: 16.0) {
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
            Text("\(overallQuantity)")
                .font(.system(size: 16.0))
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                .frame(width: 30.0)
            ControlButton(
                type: .plus,
                action: {
                    overallQuantity += 1
                    onQuantityChaned(overallQuantity)
                }
            )
        }
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
            Image(systemName: type.rawValue)
                .foregroundColor(.white)
                .font(.system(size: 25.0, weight: .bold))
                .frame(width: 35.0, height: 35.0)
                .background(Color.primaryColor)
                .clipShape(Circle())
        }

    }
}

// MARK: Previews

 struct PriceControlButtonPreviews: PreviewProvider {
    static var previews: some View {
        PriceControl(
            overallQuantity: .constant(3),
            onQuantityChaned: {_ in}
        )
    }
}
