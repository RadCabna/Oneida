//
//  Rules.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 17.03.2025.
//

import SwiftUI

struct Rules: View {
    @State private var rulesArray = Arrays.rulesArray
    @State private var rulesNumber = 0
    @State private var rulesOpacity: CGFloat = 1
    @Binding var showRules: Bool
    var body: some View {
        ZStack {
            HStack {
                Image("arrowBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .onTapGesture {
                        showRules.toggle()
                    }
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.36)
                .overlay(
                    ZStack {
                        Image(rulesArray[rulesNumber])
                            .resizable()
                            .scaledToFit()
                            .frame(width: screenWidth*0.5)
                            .offset(y: screenWidth*0.036)
                            .opacity(rulesOpacity)
                        VStack {
                            Text("RULES")
                                .font(Font.custom("TitanOne", size: screenWidth*0.05))
                                .foregroundColor(.white)
                            Spacer()
                            HStack {
                                Buttons(size: 0.04 ,text: "BACK")
                                    .onTapGesture {
                                        changeRules(direction: -1)
                                    }
                                Spacer()
                                Buttons(size: 0.04 ,text: "NEXT")
                                    .onTapGesture {
                                        changeRules(direction: 1)
                                    }
                            }
                            .padding(.horizontal, screenWidth*0.03)
                        }
                        .padding(.vertical, screenWidth*0.03)
                    }
                )
                .offset(y: screenWidth*0.02)
        }
    }
    
    func changeRules(direction: Int) {
        withAnimation(Animation.easeInOut(duration: 0.3)) {
            rulesOpacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                rulesNumber += direction
                if rulesNumber == -1 {
                    rulesNumber = 4
                }
                if rulesNumber == 5 {
                    rulesNumber = 0
                }
            withAnimation(Animation.easeInOut(duration: 0.3)) {
                rulesOpacity = 1
            }
        }
    }
    
}

#Preview {
    Rules(showRules: .constant(true))
}
