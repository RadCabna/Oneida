//
//  Game.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 16.03.2025.
//

import SwiftUI

struct Game: View {
    @AppStorage("coinCount") var coinCount = 0
    @State private var showPause = false
    @State private var shopItemsData = UserDefaults.standard.array(forKey: "shopItemsData") as? [Int] ?? [0,0,0,0,0,0,0,0]
    @State private var kitchenData = UserDefaults.standard.array(forKey: "kitchenData") as? [Int] ?? [1,1]
    @State private var cleaningData = UserDefaults.standard.array(forKey: "cleaningData") as? [Int] ?? [1,1]
    @State private var visitorsArray = Arrays.visitorsArray
    @State private var randomeVisitor = Visitor(visitorImage: "visitor1", visitorDecireImage: "desire3")
    @State private var keysArray = Arrays.keysArray
    @State private var keysData = UserDefaults.standard.array(forKey: "keysData") as? [Int] ?? [1,1,1,1,1,1,1,1,1,1,1,1]
    @State private var visitorsIndexInRoomData = UserDefaults.standard.array(forKey: "visitorsIndexInRoomData") as? [Int] ?? [1,1,1,1,1,1,1,1,1,1,1,1]
    @State private var keysTimeData = UserDefaults.standard.array(forKey: "keysTimeData") as? [Int] ?? [20,20,20,20,20,20,20,20,20,20,20,20]
    @State private var visitorComeIn = false
    @State private var visitorComeOut = false
    @State private var visitorPatienceLevel = 30
    @State private var timerVisitorComeIn: Timer? = nil
    @State private var checkVisitorsTimer: Timer? = nil
    @State private var visitorsInRoomTimer: Timer? = nil
    @State private var comeInVisitorOpacity: CGFloat = 0
    @State private var comeOutVisitorOpacity: CGFloat = 0
    @State private var selectedKeyIndex = 20
    @State private var keySelected = false
    @State private var guestIndexInRoom = 0
    var body: some View {
        ZStack {
            Background()
            HStack {
                Image("pauseButton")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.05)
                    .onTapGesture {
                        showPause.toggle()
                        UserDefaults.standard.removeObject(forKey: "shopItemsData")
                        UserDefaults.standard.removeObject(forKey: "kitchenData")
                        UserDefaults.standard.removeObject(forKey: "cleaningData")
                        UserDefaults.standard.removeObject(forKey: "keysData")
                        UserDefaults.standard.removeObject(forKey: "keysTimeData")
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
            HStack {
                Image("serviceFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.1)
                    .overlay(
                        VStack {
                            Text("KITCHEN")
                                .font(Font.custom("TitanOne", size: screenWidth*0.015))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                            HStack {
                                ForEach(0..<kitchenData.count, id: \.self) { item in
                                Image("serviceItemFrame")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.05)
                                        .overlay(
                                            VStack(spacing: screenWidth*0.004) {
                                                Circle()
                                                    .frame(width: screenWidth*0.008)
                                                    .foregroundColor(kitchenData[item] == 1 ? .green : .red)
                                                Image("bell")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                        )
                                }
                            }
                        }
                    )
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
                Spacer()
                    .frame(width: screenWidth*0.5)
                Image("serviceFrame")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.1)
                    .overlay(
                        VStack {
                            Text("CLEANING")
                                .font(Font.custom("TitanOne", size: screenWidth*0.015))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2)
                            HStack {
                                ForEach(0..<cleaningData.count, id: \.self) { item in
                                Image("serviceItemFrame")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: screenWidth*0.05)
                                        .overlay(
                                            VStack(spacing: screenWidth*0.004) {
                                                Circle()
                                                    .frame(width: screenWidth*0.008)
                                                    .foregroundColor(cleaningData[item] == 1 ? .green : .red)
                                                Image("pipidaster")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.03)
                                            }
                                        )
                                }
                            }
                        }
                    )
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            HStack(spacing: screenWidth*0.04) {
                VStack {
                    Text("SINGLE")
                        .font(Font.custom("TitanOne", size: screenWidth*0.018))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                    HStack {
                        ForEach(0..<4, id: \.self) { item in
                            ZStack {
                                Image("keyFrame")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.05)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .overlay(
                                        VStack(spacing: screenWidth*0.004) {
                                            Circle()
                                                .frame(height: screenWidth*0.008)
                                                .foregroundColor(whatStatusRoom(item: item))
                                            if keysData[item] == 1 {
                                                Image("key")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.025)
                                            } else {
                                                Text("\(keysTimeData[item])")
                                                    .font(Font.custom("TitanOne", size: screenWidth*0.015))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                            }
                                        }
                                    )
                                    .onTapGesture {
                                        tapOnKey(item: item)
                                    }
                            }
                        }
                    }
                    Text("FAMILY")
                        .font(Font.custom("TitanOne", size: screenWidth*0.018))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                    HStack {
                        ForEach(8..<10, id: \.self) { item in
                            ZStack {
                                Image("keyFrame")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.05)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .overlay(
                                        VStack(spacing: screenWidth*0.004) {
                                            Circle()
                                                .frame(height: screenWidth*0.008)
                                                .foregroundColor(whatStatusRoom(item: item))
                                            if keysData[item] == 1 {
                                                Image("key")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.025)
                                            } else {
                                                Text("\(keysTimeData[item])")
                                                    .font(Font.custom("TitanOne", size: screenWidth*0.018))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                            }
                                        }
                                    )
                                    .onTapGesture {
                                        tapOnKey(item: item)
                                    }
                            }
                        }
                    }
                }
                VStack {
                    Text("DOUBLE")
                        .font(Font.custom("TitanOne", size: screenWidth*0.018))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                    HStack {
                        ForEach(4..<8, id: \.self) { item in
                            ZStack {
                                Image("keyFrame")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.05)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .overlay(
                                        VStack(spacing: screenWidth*0.004) {
                                            Circle()
                                                .frame(height: screenWidth*0.008)
                                                .foregroundColor(whatStatusRoom(item: item))
                                            if keysData[item] == 1 {
                                                Image("key")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.025)
                                            } else {
                                                Text("\(keysTimeData[item])")
                                                    .font(Font.custom("TitanOne", size: screenWidth*0.015))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                            }
                                        }
                                    )
                                    .onTapGesture {
                                        tapOnKey(item: item)
                                    }
                            }
                        }
                    }
                    Text("LUXURY")
                        .font(Font.custom("TitanOne", size: screenWidth*0.018))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                    HStack {
                        ForEach(10..<12, id: \.self) { item in
                            ZStack {
                                Image("keyFrame")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: screenWidth*0.05)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .shadow(color: .white, radius: keysArray[item].isChosen ? 4 : 0)
                                    .overlay(
                                        VStack(spacing: screenWidth*0.004) {
                                            Circle()
                                                .frame(height: screenWidth*0.008)
                                                .foregroundColor(whatStatusRoom(item: item))
                                            if keysData[item] == 1 {
                                                Image("key")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(height: screenWidth*0.025)
                                            } else {
                                                Text("\(keysTimeData[item])")
                                                    .font(Font.custom("TitanOne", size: screenWidth*0.018))
                                                    .foregroundColor(.white)
                                                    .shadow(color: .black, radius: 2)
                                            }
                                        }
                                    )
                                    .onTapGesture {
                                        tapOnKey(item: item)
                                    }
                            }
                        }
                    }
                }
            }
            .offset(y: -screenWidth*0.095)
            .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            if shopItemsData[1] == 1 {
                Image("shopCat")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.04)
                    .offset(x: -screenWidth*0.38, y: screenWidth*0.11)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            if shopItemsData[2] == 1 {
                HStack {
                    Image("shopTree")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.2)
                    Spacer()
                        .frame(width: screenWidth*0.2)
                    Image("shopTree")
                        .resizable()
                        .scaledToFit()
                        .frame(height: screenWidth*0.2)
                }
                .offset(y: screenWidth*0.15)
                .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            if shopItemsData[3] == 1 {
                Image("shopLaptop")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.04)
                    .offset(y: screenWidth*0.005)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            if shopItemsData[4] == 1 {
                Image("shopStatue")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.15)
                    .offset(y: screenWidth*0.15)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            if shopItemsData[5] == 1 {
                Image("shopWelcome")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.03)
                    .offset(y: screenWidth*0.045)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            if shopItemsData[6] == 1 {
                Image("shopBell")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.02)
                    .offset(x: screenWidth*0.09 ,y: screenWidth*0.02)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            if shopItemsData[7] == 1 {
                Image("shopClock")
                    .resizable()
                    .scaledToFit()
                    .frame(height: screenWidth*0.03)
                    .offset(x: -screenWidth*0.07 ,y: screenWidth*0.012)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
            
            if visitorComeIn {
                VisitorView(visitorImage: randomeVisitor.visitorImage,
                            visitorDesire: randomeVisitor.visitorDecireImage,
                            patienceLevel: visitorPatienceLevel)
                .opacity(comeInVisitorOpacity)
                    .offset(x: -screenWidth*0.2, y: screenWidth*0.15)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
                    .onTapGesture {
                        keyTheGuest()
                    }
            }
            if visitorComeOut {
                VisitorView()
                    .opacity(comeOutVisitorOpacity)
                    .offset(x: screenWidth*0.2, y: screenWidth*0.15)
                    .scaleEffect(x: screenWidth/932, y: screenWidth/932)
            }
        }
        
        .onChange(of: visitorComeIn) { _ in
        showHideInVisitor()
        }
        
        .onChange(of: visitorComeOut) { _ in
        showHideOutVisitor()
        }
        
        .onChange(of: visitorPatienceLevel) { _ in
            if visitorPatienceLevel <= 0 {
                withAnimation(Animation.easeInOut(duration: 0.7)) {
                    comeInVisitorOpacity = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    visitorComeIn = false
                }
            }
        }
        
        .onAppear {
            randomeVisitor = visitorsArray.randomElement() ?? Visitor(visitorImage: "visitor1", visitorDecireImage: "desire3")
            guestIndexInRoom = visitorsArray.firstIndex(where: {$0 == randomeVisitor}) ?? 0
            startCheckVisitorsTimer()
            startVisitorComeInTimer()
            visitorComeIn = true
            startRoomTimer()
        }
        
    }
    
    func keyTheGuest() {
        if keySelected {
            if randomeVisitor.visitorDecireImage == "desire0" || randomeVisitor.visitorDecireImage == keysArray[selectedKeyIndex].keyDesire {
                withAnimation(Animation.easeInOut(duration: 0.7)) {
                    comeInVisitorOpacity = 0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    visitorComeIn = false
                }
                keysData[selectedKeyIndex] = 2
                visitorsIndexInRoomData[selectedKeyIndex] = guestIndexInRoom
                UserDefaults.standard.setValue(keysData, forKey: "keysData")
                keySelected = false
                withAnimation(Animation.easeInOut(duration: 0.7)) {
                    comeInVisitorOpacity = 0
                }
                
            } else {
                randomeVisitor.visitorPatience -= 2
            }
           resetVisitorPatience()
            
        }
    }
    
    func tapOnKey(item: Int) {
        if keysData[item] == 1 {
            for i in 0..<keysArray.count {
                keysArray[i].isChosen = false
            }
            keysArray[item].isChosen = true
            keySelected = true
            selectedKeyIndex = item
        }
    }
    
    func whatStatusRoom(item: Int) -> Color {
        switch keysData[item] {
        case 1:
           return .green
        case 2:
            return .red
        case 3:
            return .blue
        case 4:
            return .yellow
        default:
            return .green
        }
    }
    
    func showHideInVisitor() {
        if visitorComeIn {
            visitorPatienceLevel = 30
            withAnimation(Animation.easeInOut(duration: 0.7)) {
                comeInVisitorOpacity = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 27) {
               
                resetVisitorPatience()
            }
        }
    }
    
    func resetVisitorPatience() {
        for i in 0..<visitorsArray.count {
            visitorsArray[i].visitorPatience = 30
        }
    }
    
    func showHideOutVisitor() {
        if visitorComeOut {
            withAnimation(Animation.easeInOut(duration: 0.7)) {
                comeOutVisitorOpacity = 1
            }
        } else {
            withAnimation(Animation.easeInOut(duration: 0.7)) {
                comeOutVisitorOpacity = 0
            }
        }
    }
    
    func startRoomTimer() {
        visitorsInRoomTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true) { _ in
            for i in 0..<keysTimeData.count {
                if keysTimeData[i] > 0 && keysData[i] > 1 {
                    keysTimeData[i] -= 1
                }
            }
        }
    }
    
    func stopRoomTimer() {
        timerVisitorComeIn?.invalidate()
        timerVisitorComeIn = nil
        UserDefaults.standard.setValue(keysTimeData, forKey: "keysTimeData")
    }
    
    func startCheckVisitorsTimer() {
        checkVisitorsTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(3), repeats: true) { _ in
            if !visitorComeIn && !visitorComeOut {
                randomeVisitor = visitorsArray.randomElement() ?? Visitor(visitorImage: "visitor1", visitorDecireImage: "desire3")
                guestIndexInRoom = visitorsArray.firstIndex(where: {$0 == randomeVisitor}) ?? 0
                visitorComeIn = true
            }
        }
    }
    
    func stopCheckVisitorsTimer() {
        checkVisitorsTimer?.invalidate()
        checkVisitorsTimer = nil
    }
    
    func startVisitorComeInTimer() {
        timerVisitorComeIn = Timer.scheduledTimer(withTimeInterval: TimeInterval(1), repeats: true) { _ in
            if visitorPatienceLevel > 0 && visitorComeIn{
                visitorPatienceLevel -= 1
            }
        }
    }
    
    func stopVisitorComeInTimer() {
        timerVisitorComeIn?.invalidate()
        timerVisitorComeIn = nil
    }
    
}

#Preview {
    Game()
}
