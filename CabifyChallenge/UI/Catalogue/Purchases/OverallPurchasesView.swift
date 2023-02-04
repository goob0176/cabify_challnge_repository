//
//  OverallPurchasesView.swift
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

struct OverallPurchasesView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("You have purchased items")
                    .bold()
                Spacer()
                    .frame(height: Constants.titleSpace)
                HStack {
                    Text("Old price:")
                        .foregroundColor(.gray)
                    Text("24.99 €")
                        .bold()
                        .strikethrough()
                }
                HStack {
                    Text("New price:")
                        .foregroundColor(.gray)
                    Text("19.00 €")
                        .foregroundColor(.primaryColor)
                        .bold()
                }
                HStack {
                    Text("You save:")
                        .foregroundColor(.gray)
                    Text("5.00 €")
                        .foregroundColor(.primaryColor)
                        .bold()
                }
            }
            Spacer()
            Button {
                
            } label: {
                Text("Purchase")
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

struct OverallPurchasesView_Previews: PreviewProvider {
    static var previews: some View {
        OverallPurchasesView()
    }
}
