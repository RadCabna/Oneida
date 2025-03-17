//
//  Loading.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import SwiftUI

struct Loading: View {
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        ZStack {
            Background()
            GeometryReader { geometry in
                let height = geometry.size.height
                let width = geometry.size.width
                let isLandscape = width > height
                if isLandscape {
                    ZStack {
                        Text("LOADING...")
                            .font(Font.custom("TitanOne", size: width*0.05))
                            .foregroundColor(.white)
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .padding(.bottom)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                } else {
                    ZStack {
                        Text("LOADING...")
                            .font(Font.custom("TitanOne", size: height*0.05))
                            .foregroundColor(.white)
                            .rotationEffect(Angle(degrees: -90))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.bottom)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
            }
        }
    }
}

#Preview {
    Loading()
}
