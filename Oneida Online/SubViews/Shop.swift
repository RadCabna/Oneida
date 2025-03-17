//
//  Shop.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import SwiftUI

struct Shop: View {
    @AppStorage("coinCount") var coinCount = 0
    @State private var shopItemsArray = Arrays.shopItemsArray
    @State private var shopItemsData = UserDefaults.standard.array(forKey: "shopItemsData") as? [Int] ?? [0,0,0,0,0,0,0,0]
    @Binding var showShop: Bool
    var body: some View {
        ZStack {
            HStack {
                Image("arrowBack")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .onTapGesture {
                        showShop.toggle()
                    }
                Spacer()
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
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            Image("shopFrame")
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.35)
                .overlay(
                    VStack {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 0, maximum: screenWidth*0.12)), count: 4), spacing: screenWidth*0.025) {
                            ForEach(0..<shopItemsArray.count, id: \.self) { id in
                                ZStack {
                                    Image(shopItemsArray[id].itemImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.09)
                                    if shopItemsData[id] == 0 {
                                        if coinCount >= shopItemsArray[id].itemCost {
                                            Image("greenShopButton")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: screenWidth*0.025)
                                                .overlay(
                                                    Text("\(shopItemsArray[id].itemCost)")
                                                        .font(Font.custom("TitanOne", size: screenWidth*0.015))
                                                        .foregroundColor(.white)
                                                        .shadow(color: .black, radius: 2)
                                                )
                                                .offset(y: screenWidth*0.035)
                                                .onTapGesture {
                                                    buyItem(id: id)
                                                }
                                        } else {
                                            Image("redShopButton")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: screenWidth*0.025)
                                                .overlay(
                                                    Text("\(shopItemsArray[id].itemCost)")
                                                        .font(Font.custom("TitanOne", size: screenWidth*0.015))
                                                        .foregroundColor(.white)
                                                        .shadow(color: .black, radius: 2)
                                                )
                                                .offset(y: screenWidth*0.035)
                                        }
                                    }
                                    if shopItemsData[id] == 1 {
                                        Image("greenShopButton")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: screenWidth*0.025)
                                            .overlay(
                                                Text("BOUGHT")
                                                    .font(Font.custom("TitanOne", size: screenWidth*0.012))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                            )
                                            .offset(y: screenWidth*0.035)
                                    }
                                }
                            }
                        }
                    }
                        .offset(y: screenWidth*0.045)
                )
                .offset(y: screenWidth*0.03)
        }
    }
    
    func buyItem(id: Int) {
        if coinCount >= shopItemsArray[id].itemCost {
            coinCount -= shopItemsArray[id].itemCost
            shopItemsData[id] = 1
            UserDefaults.standard.setValue(shopItemsData, forKey: "shopItemsData")
        }
    }
    
}

#Preview {
    Shop(showShop: .constant(true))
}
