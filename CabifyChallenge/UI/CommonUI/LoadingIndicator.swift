//
//  LoadingIndicator.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

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
            .trim(from: 0, to: 0.65)
            .stroke(color, lineWidth: 10.0)
            .frame(width: 75.0, height: 75.0)
            .rotationEffect(
                Angle(degrees: shouldAnimate ? 0 : 360.0)
            )
            .onAppear {
                withAnimation(
                    .linear(duration:1.0).repeatForever(autoreverses: false)
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
