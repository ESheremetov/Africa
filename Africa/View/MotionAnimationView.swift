//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Егор Шереметов on 07.01.2022.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: - PROPERTIES
    
    @State private var randomCirclesNumber = Int.random(in: 12...16)
    @State private var isAnimated: Bool = false
    
    // MARK: - FUNCTIONS
    func randomCoords(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCirclesNumber, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimated ? randomScale() : 1)
                        .position(
                            x: randomCoords(max: geometry.size.width),
                            y: randomCoords(max: geometry.size.height)
                            )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay()))
                } //: LOOP
                .onAppear {
                    isAnimated = true
                }
            } //: ZSTACK
            .drawingGroup()
        } //: GEOMETRY
    }
}

// MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
