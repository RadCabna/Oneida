//
//  PauseView.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 17.03.2025.
//

import SwiftUI

struct PauseView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Binding var showPause: Bool
    var body: some View {
        ZStack {
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.3)
                .overlay(
                    VStack {
                        Text("PAUSE")
                            .font(Font.custom("TitanOne", size: screenWidth*0.05))
                            .foregroundColor(.white)
                        Buttons(size: 0.07, text: "RESUME")
                            .onTapGesture {
                                showPause.toggle()
                            }
                        Buttons(size: 0.07, text: "MENU")
                            .onTapGesture {
                                coordinator.navigate(to: .main)
                            }
                    }
                        )
        }
    }
}

#Preview {
    PauseView(showPause: .constant(true))
}
