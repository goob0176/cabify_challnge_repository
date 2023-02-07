//
//  OrderCompletedView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 07.02.2023.
//

import SwiftUI

private struct Constants {
    static let headerFont: Font = .system(size: 40.0, weight: .bold)
    static let emojiiFont: Font = .system(size: 52.0)
    static let bottomPadding = 50.0
}

struct OrderCompletedView: View {
    @Binding
    var isActive: Bool
    
    let viewModel: OrderCompletedType

    init(
        viewModel: OrderCompletedType,
         isActive: Binding<Bool>
    ) {
        self.viewModel = viewModel
        _isActive = isActive
    }
    
    var body: some View {
        ZStack {
            Color.green
            VStack(alignment: .leading) {
                Spacer()
                Text(Localization.orderCompletedHeader)
                    .foregroundColor(.white)
                    .font(Constants.headerFont)
                Text(viewModel.productsEmojis)
                    .font(Constants.emojiiFont)
                Spacer()
                PrimaryButton(
                    title: Localization.orderCompletedButtonTitle,
                    textColor: .green,
                    action: {
                        isActive = false
                    }
                )
                .padding(.horizontal)
                .padding(
                    .bottom,
                    Constants.bottomPadding
                )
            }
            .padding(.horizontal)
            .transition(.move(edge: .bottom))
        }
        .ignoresSafeArea()
    }
}

struct OrderCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletedView(
            viewModel: OrderCompletedViewModel(
                productCodes: ["VOUCHER", "TSHIRT", "MUG"]
            ),
            isActive: .constant(true)
        )
    }
}
