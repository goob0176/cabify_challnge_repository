//
//  LoadingIndicator.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

private struct Constants {
    static let trimEndPoint = 0.65
    static let loaderLineWidth = 10.0
    static let loaderSideSize = 75.0
    static let rotationEffect = 360.0
    static let loaderAnimationDuration = 1.0
}

struct LoadingIndicator: View {
    private var color: Color
    private var isLoading: Bool
    
    @State
    private var shouldAnimate: Bool = false
    
    init(
        color: Color = .white,
        isLoading: Bool
    ) {
        self.color = color
        self.isLoading = isLoading
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: Constants.trimEndPoint)
            .stroke(color, lineWidth: Constants.loaderLineWidth)
            .frame(
                width: Constants.loaderSideSize,
                height: Constants.loaderSideSize
            )
            .rotationEffect(
                Angle(degrees: shouldAnimate ? 0 : Constants.rotationEffect)
            )
            .onAppear {
                withAnimation(
                    .linear(duration: Constants.loaderAnimationDuration)
                    .repeatForever(autoreverses: false)
                ) {
                    shouldAnimate = isLoading
                }
            }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(
            color: .blue,
            isLoading: false
        )
    }
}
