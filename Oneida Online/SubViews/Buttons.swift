//
//  Buttons.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import SwiftUI

struct Buttons: View {
    var size = 0.05
    var text = "START"
    var body: some View {
        Image("menuButton")
            .resizable()
            .scaledToFit()
            .frame(height: screenWidth*size)
            .overlay(
                Text(text)
                    .font(Font.custom("TitanOne", size: screenWidth*size*0.45))
                    .foregroundColor(.white)
                    .padding(.bottom, screenWidth*size*0.05)
            )
    }
}

#Preview {
    Buttons()
}
