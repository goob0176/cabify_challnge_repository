//
//  CheckoutView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 03.02.2023.
//

import SwiftUI

// MARK: - Constants

private struct Constants {
    static let textPadding = 8.0
    static let overallCornerRadius = 18.5
    static let titleSpace = 8.0
    static let cornerRadius = 16.0
    static let shadowRadius = 8.0
    static let font: Font = .system(size: 16.0, weight: .bold)
}

// MARK: - View

struct CheckoutView: View {
    private let viewModel: CheckoutViewModelType
    
    init(viewModel: CheckoutViewModelType) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(Localization.itemsPurchasedMsg) \(viewModel.totalProducts)")
                    .bold()
                Spacer()
                    .frame(height: Constants.titleSpace)
                HStack {
                    Text(viewModel.discountValue.isEmpty ? Localization.yourPriceMsg : Localization.oldPriceMsg)
                        .foregroundColor(.gray)
                    Text(viewModel.totalPrice)
                        .bold()
                        .strikethrough(!viewModel.discountValue.isEmpty)
                }
                
                if !viewModel.discountValue.isEmpty {
                    HStack {
                        Text(Localization.newPriceMsg)
                            .foregroundColor(.gray)
                        Text(viewModel.priceWithDiscount)
                            .foregroundColor(.primaryColor)
                            .bold()
                    }
                    HStack {
                        Text(Localization.youSaveMsg)
                            .foregroundColor(.gray)
                        Text(viewModel.discountValue)
                            .foregroundColor(.primaryColor)
                            .bold()
                    }
                }
            }
            Spacer()
            Button {
                viewModel.onPurchase()
            } label: {
                Text(Localization.purchaseButtonTitle)
                    .padding(Constants.textPadding)
                    .foregroundColor(.white)
                    .font(Constants.font)
                    .background(Color.primaryColor)
                    .cornerRadius(Constants.overallCornerRadius)
            }
            
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
        .shadow(radius: Constants.shadowRadius)
        .padding(.horizontal)
        .transition(.move(edge: .bottom))
    }
}

// MARK: - Previews

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(
            viewModel: CheckoutViewModel(
                checkoutItem: CheckoutItem(
                    totalItems: 7,
                    totalPrice: 120.0,
                    totalDiscount: 20.0
                )
            )
        )
    }
}
