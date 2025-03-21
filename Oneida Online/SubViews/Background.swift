//
//  Background.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import SwiftUI

struct Background: View {
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            let isLandscape = width > height
            if isLandscape {
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width*1.7)
                    .scaleEffect(x: 1.01)
                    .ignoresSafeArea()
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            } else {
                Image("background")
                    .resizable()
                    .frame(width: height*1.2, height: width)
                    .rotationEffect(Angle(degrees: -90))
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                    
            }
        }
    }
}

#Preview {
    Background()
}
