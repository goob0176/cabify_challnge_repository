//
//  ProductRow.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 02.02.2023.
//

import Foundation
import SwiftUI

struct ProductRow: View {
    private let viewModel: ProductRowType
    
    @State
    private var products = 0
    
    init(viewModel: ProductRowType) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 20.0) {
                Image(viewModel.code ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100.0, height: 150.0)
                    .background(Color.gray)
                    .clipped()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(viewModel.name ?? "")
                            .font(.system(size: 20.0, weight: .bold))
                            .minimumScaleFactor(0.8)
                            .lineLimit(2)
                        Text("Special offer available!")
                            .foregroundColor(.primaryColor)
                    }
                    Spacer()
                        .frame(height: 50.0)
                    HStack {
                        Text(viewModel.price ?? "")
                            .font(.system(size: 20.0, weight: .bold))
                        Spacer()
                        PriceControl(overallQuantity: $products) { _ in
                            
                        }
                    }
                }
                Spacer()
            }
            Divider()
        }
    }
}

struct ProductRowPreviews: PreviewProvider {
    static var previews: some View {
        ProductRow(
            viewModel: ProductRowViewModel.from(
                MocksFactory.models()[0]
            )
        )
    }
}
