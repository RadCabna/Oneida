//
//  Settings.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import SwiftUI

struct Settings: View {
    @AppStorage("music") var music = true
    @Binding var showSettings: Bool
    var body: some View {
        ZStack {
            HStack {
                Image("arrowBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .onTapGesture {
                        showSettings.toggle()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            Image("settingsFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.3)
                .overlay(
                    VStack {
                        Text("SETTINGS")
                            .font(Font.custom("TitanOne", size: screenWidth*0.045))
                            .foregroundColor(.white)
                        Text("MUSIC")
                            .font(Font.custom("TitanOne", size: screenWidth*0.03))
                            .foregroundColor(.white)
                        ZStack {
                            Toggle("", isOn: $music)
                                .toggleStyle(CustomToggle())
                            HStack {
                                Text("OFF")
                                    .font(Font.custom("TitanOne", size: screenWidth*0.03))
                                    .foregroundColor(.white)
                                Spacer()
                                Text("ON")
                                    .font(Font.custom("TitanOne", size: screenWidth*0.03))
                                    .foregroundColor(.white)
                            }
                            .frame(maxWidth: screenWidth*0.27)
                            .offset(x: -screenWidth*0.006)
                        }
                        Buttons(size: 0.07, text: "RULES")
                    }
                )
                .offset(y: screenWidth*0.025)
        }
    }
}

#Preview {
    Settings(showSettings: .constant(true))
}

struct CustomToggle: ToggleStyle {
    var screenHeight = UIScreen.main.bounds.height
    var screenWidth = UIScreen.main.bounds.width
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack {
               Image("toggleBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth * 0.043)
                Image(configuration.isOn ? "toggleOn" : "toggleOff")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.035)
                    .offset(x: configuration.isOn ? screenWidth * 0.049 : -screenWidth * 0.049)
                    .animation(.easeInOut(duration: 0.2), value: configuration.isOn)
            }
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
    }
}
