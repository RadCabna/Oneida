//
//  VisitorView.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 16.03.2025.
//

import SwiftUI

struct VisitorView: View {
    var visitorImage = "visitor1"
    var visitorDesire = "desire0"
    var patienceLevel = 30
    var ovalName = "greenOval"
    var emotion = "patienceGood"
    var desireActive = true
    var patienceActive = true
    var visitorReward = 20
    var body: some View {
        ZStack {
            Image(visitorImage)
                .resizable()
                .scaledToFit()
                .frame(height: screenWidth*0.3)
            if desireActive {
                Image(visitorDesire)
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.07)
                    .offset(y: -screenWidth*0.18)
            } else {
                HStack(spacing: 0) {
                    Image("coin")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.015)
                    Text("+\(visitorReward)")
                        .font(Font.custom("TitanOne", size: screenWidth*0.015))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                }
                .offset(x: 0, y: -screenWidth*0.17)
            }
            if patienceActive {
                HStack {
                    ZStack {
                        Image("patienceFrameBack")
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenWidth*0.1)
                        Image(whatOvalColorPresented())
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenWidth*0.097)
                            .offset(y: screenWidth * 0.106 * (1 - Double(patienceLevel) / 30))
                            .mask(
                                Image("greenOval")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.097)
                            )
                    }
                    VStack {
                        Image(whatPatiencePresented())
                            .resizable()
                            .scaledToFit()
                            .frame(height: screenHeight*0.06)
                        Text("\(patienceLevel) sec")
                            .font(Font.custom("TitanOne", size: screenWidth*0.015))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2)
                    }
                    .frame(maxWidth: screenWidth*0.06)
                }
                .offset(x: screenWidth*0.14, y: -screenWidth*0.07)
            }
        }
    }
    
    func whatPatiencePresented() -> String {
        switch patienceLevel {
        case 16...30:
            return "patienceGood"
        case 6...16:
            return "patienceNormal"
        case 0...5:
            return "patienceAngry"
        default:
            return "patienceGood"
        }
    }
    
    func whatOvalColorPresented() -> String {
        switch patienceLevel {
        case 16...30:
            return "greenOval"
        case 6...16:
            return "orangeOval"
        case 0...5:
            return "redOval"
        default:
            return "greenOval"
        }
    }
    
}

#Preview {
    VisitorView()
}
