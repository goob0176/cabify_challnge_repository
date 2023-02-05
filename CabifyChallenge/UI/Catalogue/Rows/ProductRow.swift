//
//  ProductRow.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation
import SwiftUI

// MARK: Constants

private struct Constants {
    static let titlesStackSpacing = 7.0
    static let titleTopPadding = 6.0
    static let titleFontSize = 14.0
    static let priceFontSize = 20.0
    static let subtitleFontSize = 14.0
    static let horizontalPadding = 30.0
    static let verticalPadding = 10.0
    static let purchaseButtonCornerRadius = 18.5
    static let overallCornerRadius = 6.0
    static let lineWidth = 2.0
    static let backgroundOpacity = 0.05
    static let buttonLineLimit = 1
    static let priceLineLimit = 1
    static let buttonMinimumScaleFactor = 0.7
    static let priceLabelMinimumScaleFactor = 0.6
    static let minHeight = 140.0
    static let idealHeight = 150.0
    static let maxHeight = 350.0
}

// MARK: Views

struct ProductRow<ViewModel: ProductRowType>: View {
    @StateObject
    private var viewModel: ViewModel
    
    @State
    private var products = 0
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(
                alignment: .leading,
                spacing: Constants.titlesStackSpacing
            ) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: Constants.titlesStackSpacing) {
                        Text(viewModel.title)
                            .foregroundColor(.gray)
                            .font(.system(size: Constants.titleFontSize))
                            .padding(.top, Constants.titleTopPadding)
                        Text(viewModel.formattedPrice)
                            .font(.system(size: Constants.priceFontSize, weight: .bold))
                            .lineLimit(Constants.priceLineLimit)
                            .minimumScaleFactor(Constants.priceLabelMinimumScaleFactor)
                    }
                    Spacer()
                    CartControl(
                        overallQuantity: $products,
                        onQuantityChaned: {_ in}
                    )
                }
                Text("\(Localization.itemsInCartMsg) \(products)")
                    .foregroundColor(.gray)
                    .font(.system(size: Constants.subtitleFontSize))
            }
            .padding()
            .background(Color.primaryColor.opacity(Constants.backgroundOpacity))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.overallCornerRadius)
                    .stroke(Color.primaryColor, lineWidth: Constants.lineWidth)
            )
            .overlay(
                SpecialOfferBadgeView(
                    width: proxy.size.width / 1.5,
                    title: viewModel.discountTitle
                )
                .position(
                    x: proxy.frame(in: .local).midX,
                    y: proxy.frame(in: .local).minY
                )
            )
        }
        .frame(
            minHeight: Constants.minHeight,
            idealHeight: Constants.idealHeight,
            maxHeight: Constants.maxHeight
        )
    }
}

// MARK: Previews

struct ProductRowPreviews: PreviewProvider {
    static var previews: some View {
        ProductRow(
            viewModel: ViewModelsFactory.productRowViewModel(product: MocksFactory.models()[0])
        )
    }
}
