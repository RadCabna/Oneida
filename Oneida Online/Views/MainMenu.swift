//
//  MainMenu.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import SwiftUI

struct MainMenu: View {
    @AppStorage("coinCount") var coinCount = 0
    @State private var showSettings = false
    @State private var showShop = false
    @State private var menuShadowOpacity: CGFloat = 0
    @State private var shopItemsData = UserDefaults.standard.array(forKey: "shopItemsData") as? [Int] ?? [0,0,0,0,0,0,0,0]
    var body: some View {
        ZStack {
            Background()
            HStack {
                Image("coinIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                Image("coinCountFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .overlay(
                        Text("\(coinCount)")
                            .font(Font.custom("TitanOne", size: screenWidth*0.025))
                            .foregroundColor(.white)
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            VStack {
                    Buttons(size: 0.06, text: "START")
                HStack {
                    Buttons(size: 0.06, text: "SETTINGS")
                        .onTapGesture {
                            showSettings.toggle()
                        }
                    Buttons(size: 0.06, text: "SHOP")
                        .onTapGesture {
                            showShop.toggle()
                        }
                }
            }
            .offset(y: screenWidth*0.11)
            
            Color.black.ignoresSafeArea().opacity(menuShadowOpacity)
            if showSettings {
                Settings(showSettings: $showSettings)
            }
            if showShop {
                Shop(showShop: $showShop)
            }
        }
        
        .onChange(of: showSettings) { _ in
        activateMenuShadow()
        }
        .onChange(of: showShop) { _ in
        activateMenuShadow()
        }
        
    }
    
    func activateMenuShadow() {
        if showSettings || showShop {
            menuShadowOpacity = 0
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                menuShadowOpacity = 0.5
            }
        } else {
            menuShadowOpacity = 0.5
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                menuShadowOpacity = 0
            }
        }
    }
    
}

#Preview {
    MainMenu()
}
