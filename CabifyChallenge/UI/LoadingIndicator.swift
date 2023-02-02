//
//  LoadingIndicator.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

struct LoadingIndicator: View {
    private var color: Color
    
    @State
    private var isLoading: Bool
    
    init(color: Color = .white, isLoading: Bool = true) {
        self.color = color
        self.isLoading = isLoading
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.65)
            .stroke(color, lineWidth: 10.0)
            .frame(width: 75.0, height: 75.0)
            .rotationEffect(Angle(degrees: isLoading ? 0 : 360.0))
            .animation(
                Animation.linear(duration: 1.0)
                    .repeatForever(autoreverses: false),
                value: isLoading
            )
            .onAppear {
                isLoading.toggle()
            }
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator(color: .blue)
    }
}
