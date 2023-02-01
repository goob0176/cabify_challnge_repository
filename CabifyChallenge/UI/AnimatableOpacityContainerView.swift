//
//  AnimatableOpacityContainerView.swift
//  CabifyChallenge
//
//  Created by Andrey Khlopotin on 01.02.2023.
//

import SwiftUI

struct AnimatableOpacityContainerView<Content: View>: View {
    var content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    @State
    private var animateOpacity = false
    
    var body: some View {
        VStack(content: content)
            .opacity(animateOpacity ? 1.0 : 0.0)
            .onAppear {
                withAnimation {
                    animateOpacity = true
                }
            }
    }
}

struct AnimatableOpacityContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableOpacityContainerView({
            Text("Test")
        })
    }
}
